# Maintainer:
# Contributor: James Cuzella <james.cuzella@lyraphase.com>
# Contributor: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>

_pkgname="linuxtv-dvb-apps"
pkgname="$_pkgname"
pkgver=1.1.1+rev1500
pkgrel=1
pkgdesc='Linux DVB API applications and utilities'
url='https://launchpad.net/ubuntu/+source/linuxtv-dvb-apps'
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later')
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')

depends=(
  'libx11'
  'zvbi'
)
makedepends=(
  'git'
  'imagemagick'
)
optdepends=(
  'dtv-scan-tables-git: initial tuning data necessary for scanning utils'
)

_pkgsrc="launchpad.$_pkgname"
source=("$_pkgsrc"::"git+https://git.launchpad.net/ubuntu/+source/linuxtv-dvb-apps")
sha256sums=('SKIP')

prepare() {
  local src line lines

  cd "$_pkgsrc"
  mapfile -t lines < "debian/patches/series"
  for line in "${lines[@]}"; do
    if [ -e "debian/patches/$line" ]; then
      printf '\nApplying patch: %s\n' "debian/patches/$line"
      patch -Np1 -F100 -i "debian/patches/$line"
    else
      echo "Missing patch $line"
    fi
  done

  sed -E -e 's&^(CFLAGS) *=&\1 +=&' \
    -e 's&(/usr/bin)/convert (.*) (\S+) (\S+)$&\1/magick \3 \2 \4&g' \
    -i util/alevt/Makefile

  sed -E -e 's&( = require)\((\$ARGV\[0\])\);&\1("./".\2);&' -i util/scan/section_generate.pl
}

pkgver() {
  cd "$_pkgsrc"
  grep -Pom1 "^${_pkgname} "'\(\K[^-]+' debian/changelog
}

build() {
  export CFLAGS+=" -std=gnu99"
  cd "$_pkgsrc"
  make
}

package() {
  cd "$_pkgsrc"
  make DESTDIR="$pkgdir" install

  # Avoid conflict with xbase (FS#37862)
  mv "$pkgdir/usr/bin"/{zap,dvb-zap}

  # Avoid conflict with sane-scan-pdf-git
  mv "$pkgdir/usr/bin"/{scan,dvb-scan}
}
