# Maintainer: a821
# Contributor: Alad Wenter <nynq@nepuyvahk.vasb> (rot13)
# Contributor: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Chirantan Ekbote <chirantan.ekbote@gmail.com>
# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org>
# Contributor: Tsekhovoy Eugene aka Krash <8552246@gmail.com>

pkgname=mc-git
pkgver=4.8.29.r146.g299d9a2fb
pkgrel=1
pkgdesc='A file manager that emulates Norton Commander'
arch=('x86_64')
url='https://www.midnight-commander.org/'
license=('GPL')
depends=('e2fsprogs' 'glib2' 'gpm' 'libssh2' 'slang' 'which')
makedepends=('aspell' 'git' 'libxt' 'libx11' 'unzip')
optdepends=(
    'aspell: spelling corrections'
    'cabextract: ucab extfs'
    'cdparanoia: audio extfs'
    'cdrkit: iso9660 extfs'
    'cvs: CVS support'
    'gawk: hp48+ extfs'
    'mtools: a+ extfs'
    'p7zip: support for 7zip archives'
    'perl: needed by several ext2fs scripts'
    'python: to access uc1541 or s3 storage'
    'python-boto: s3+ extfs'
    'python-pytz: s3+ extfs'
    'unace: uace extfs'
    'unarj: uarj extfs'
    'unrar: urar extfs'
    'unzip: open zip archives'
    'zip: uzip extfs'
)
provides=('mc')
conflicts=('mc')
backup=('etc/mc/edit.indent.rc'
        'etc/mc/filehighlight.ini'
        'etc/mc/mcedit.menu'
        'etc/mc/mc.ext.ini'
        'etc/mc/mc.keymap'
        'etc/mc/mc.menu'
        'etc/mc/sfs.ini')
options=('!emptydirs')
source=('git+https://github.com/MidnightCommander/mc'
        'mc-python3.patch')
sha256sums=('SKIP'
            '78df8592c86445fa6249433e8587889e3923c0bb8b604cae32d5e739d2cc025c')

pkgver() {
  cd mc
  git describe --long | sed -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
}

prepare() {
  cd mc
  # port to Python 3
  # ref: https://github.com/MidnightCommander/mc/pull/149
  patch -p1 -i "../mc-python3.patch"
  ./autogen.sh
}

build() {
  cd mc

  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib \
    --sysconfdir=/etc \
    --enable-aspell \
    --with-screen=slang \
    --with-x

  make
}

package() {
  cd mc
  make DESTDIR="$pkgdir" install

  # FS#50889: Replace mc.keymap symlink with target file to fix backup mechanism.
  rm "$pkgdir/etc/mc/mc.keymap"
  cp "$pkgdir"/etc/mc/mc{.default,}.keymap
}

# vim:set ts=2 sw=2 ft=sh et:
