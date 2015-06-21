# Contributor: Xyne
# Contributor: David Manouchehri <d@32t.ca>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Thomas Jost <schnouki schnouki net>
# Contributor: Hinrich Harms <arch hinrich de>

pkgname=thunderbird-enigmail-git
pkgver=1.6.r15.gd868ff5
pkgrel=1
# The latest version can be found here
# http://releases.mozilla.org/pub/mozilla.org/thunderbird/releases/latest/source/
# Normally this should be the version in the official repos. If not then the git
# package may be incompatible.
_tbver="$(pacman -Si thunderbird | sed -n 's@^Version \+: \(.\+\)-[^-]$@\1@p')"
pkgdesc="Thunderbird extension that enables sending and receiving signed and encrypted e-mail messages"
arch=('i686' 'x86_64')
url="https://www.enigmail.net/"
license=('MPL' 'GPL')
depends=('thunderbird' 'gnupg')
makedepends=('zip' 'unzip' 'python2' 'git')
provides=('thunderbird-enigmail')
conflicts=('thunderbird-enigmail')
source=("enigmail::git://git.code.sf.net/p/enigmail/source"
        "http://releases.mozilla.org/pub/mozilla.org/thunderbird/releases/$_tbver/source/thunderbird-$_tbver.source.tar.bz2"
        "http://releases.mozilla.org/pub/mozilla.org/thunderbird/releases/$_tbver/source/thunderbird-$_tbver.source.tar.bz2.asc"
        mozconfig
        thunderbird-install-dir.patch
        vendor.js)
sha256sums=('SKIP'
            '22fb5f1e36ec4c4b42163879729b78463322412bf2f380af917b0024f355eee9'
            'SKIP'
            'd8844a988b660d40732d4694104d38dd5e8924a987d79247f9651e52fe9e4516'
            '929a7ceca0e90d0635a2099b7df24033e865fb5b5b8c5824468c4561c21c377d'
            'e4ea8e6788163d9f8db8f1f40023db3ea0a1358f9a4510169f2d4c4fe6a887ed')

pkgver() {
  cd "$srcdir/enigmail"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/enigmail\.//'
}

# From the thunderbird package.
prepare() {
  cd "$srcdir/comm-esr${_tbver%%.*}"
  patch -Np1 -i "$srcdir/thunderbird-install-dir.patch"

  cp "$srcdir/mozconfig" .mozconfig

  # configure script misdetects the preprocessor without an optimization level
  # https://bugs.archlinux.org/task/34644
  sed -i '/ac_cpp=/s/$CPPFLAGS/& -O2/' mozilla/configure
}

build() {
  # Compile Thunderbird (from the thunderbird package).
  cd "$srcdir/comm-esr${_tbver%%.*}"

  export LDFLAGS="$LDFLAGS -Wl,-rpath,/usr/lib/thunderbird"
  export PYTHON="/usr/bin/python2"

  make -j1 -f client.mk build MOZ_MAKE_FLAGS="$MAKEFLAGS"

  # Compile Enigmail
  cp -R "$srcdir"/enigmail "$srcdir"/comm-release/mailnews/extensions
  cd mailnews/extensions/enigmail
  ./makemake -r -o "$srcdir"/comm-release/obj-enigmail
  cd "$srcdir/comm-esr${_tbver%%.*}"/comm-release/obj-enigmail/mailnews/extensions/enigmail
  make

  # Create the Enigmail XPI
  make xpi
}

package() {
  cd "$srcdir/comm-esr${_tbver%%.*}"

  emid="$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' mailnews/extensions/enigmail/package/install.rdf)"

  install -d -m755 "$pkgdir"/usr/lib/thunderbird/extensions/"$emid"
  cd "$pkgdir"/usr/lib/thunderbird/extensions/"$emid"

  unzip "$srcdir"/comm-release/obj-enigmail/mozilla/dist/bin/enigmail-*.xpi
}
