# Contributor: Michael DeGuzis <mdeguzis@gmail.com>

_pkgname="devscripts"
pkgname="$_pkgname-git"
pkgver=2.23.4.r0.g5d69fc20
pkgrel=1
pkgdesc="Scripts to make the life of a Debian Package maintainer easier (git-latest)"
arch=('i686' 'x86_64')
url="https://anonscm.debian.org/git/collab-maint/devscripts.git"
license=('GPL2')
depends=(
  'dpkg'
  'perl'
  'perl-file-homedir'
  'perl-timedate'
  'sed'
  'wget'

  # AUR
  'debhelper'
  'debianutils'
  # 'po-debconf' # for debhelper
  #'sensible-utils'
)
makedepends=(
  'bash-completion'
  'docbook-xsl'
  'git'
  'help2man'
  'perl-file-basedir'
  'perl-file-desktopentry'
  'perl-libwww'
  'perl-list-compare'
  'perl-pod-parser'
  'po4a'
  'python-setuptools'

  # AUR
  'perl-git-wrapper'
  'perl-parse-debcontrol'
)
optdepends=(
  'debian-keyring: Required for commands interacting with the system / user keyring'
  'perl-file-dirlist: Required for uscan'
  'perl-file-touch: Required for uscan'
  'perl-ipc-run: Required for uscan'
  'perl-lwp-protocol-https: Required for uscan'
  'perl-moo: Required for uscan'
)
provides=(
  "$_pkgname"
  'checkbashisms'
)
conflicts=(${provides[@]})
options=('!makeflags')
source=(
  "$_pkgname"::"git+https://anonscm.debian.org/git/collab-maint/devscripts.git"
  'fixes.patch'
)

sha256sums=(
  'SKIP'
  'f8e7ce50c0d008c5d38c94b93c9fc560e5dd2cc8f06eeb2909b0b1784911b768'
)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/debian\///;s/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}

prepare(){
  cd "$srcdir/$_pkgname"
  patch -p1 -i "$srcdir/fixes.patch"

  # Ensure the local folder is recognized as a package and used appropriately.
  touch "$srcdir/devscripts/scripts/devscripts/__init__.py"
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install

  # Install the script manpages appropriately
  for script_manpage in scripts/*.1
  do
      cp -v $script_manpage "$pkgdir/usr/share/man/man1"
  done

  # Create dch symlink to debchange
  ln -s /usr/bin/debchange "$pkgdir/usr/bin/dch"

  # bts completion is present already in the official package
  rm "$pkgdir/usr/share/bash-completion/completions/bts"
}
