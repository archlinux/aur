# Maintainer: a821
# Contributor: Alad Wenter <nynq@nepuyvahk.vasb> (rot13)
# Contributor: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Chirantan Ekbote <chirantan.ekbote@gmail.com>
# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org>
# Contributor: Tsekhovoy Eugene aka Krash <8552246@gmail.com>

pkgname=mc-git
pkgver=4.8.33.r353.g32b7a14c4
pkgrel=1
pkgdesc='A file manager that emulates Norton Commander'
arch=('x86_64')
url='https://www.midnight-commander.org/'
license=('GPL-3.0-or-later')
depends=('e2fsprogs' 'glib2' 'glibc' 'gpm' 'libssh2' 'sh' 'slang' 'which')
makedepends=('aspell' 'git' 'libxt' 'libx11' 'unzip')
optdepends=(
    'aspell: spelling corrections'
    'cabextract: ucab extfs'
    'cdparanoia: audio extfs'
    'cdrkit: alternative iso9660 extfs'
    'cvs: CVS support'
    'gawk: hp48+ extfs'
    'libisoburn: iso9660 extfs'
    'mtools: a+ extfs'
    'p7zip: support for 7zip archives'
    'perl: needed by several ext2fs scripts'
    'python: to access uc1541 or s3 storage'
    'python-boto: s3+ extfs'
    'python-pytz: s3+ extfs'
    'rpm-tools: open rpm packages'
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
source=('git+https://github.com/MidnightCommander/mc')
sha256sums=('SKIP')

pkgver() {
  cd mc
  git describe --long | sed -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
}

prepare() {
  cd mc
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
  # remove s3 support until it no longer depends on deprecated python-boto:
  # https://midnight-commander.org/ticket/3904
  rm -v "$pkgdir/usr/lib/mc/extfs.d/s3+"
}

# vim:set ts=2 sw=2 ft=sh et:
