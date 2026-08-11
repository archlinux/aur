# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=(
  'nted'
  'nted-docs'
)
pkgbase=nted
pkgver=1.10.18
pkgrel=8
_deb_rel=13.1
pkgdesc="Musical score editor"
arch=('x86_64')
url="https://vsr.informatik.tu-chemnitz.de/staff/jan/nted/nted.xhtml"
license=('GPL-2.0-or-later')
depends=(
  'alsa-lib'
  'cairo'
  'freetype2'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'libgcc'
  'libstdc++'
  'libx11'
  'pango'
)
makedepends=(
  'desktop-file-utils'
  'docbook-xml'  ## docs
  'docbook-xsl'  ## docs
  'poxml'  ## docs
  'xmlto'  ## docs
  'yelp'  ## docs
)
_deb_url="https://salsa.debian.org/debian/nted/-/raw/debian/$pkgver-${_deb_rel}/debian/patches"
source=("https://vsr.informatik.tu-chemnitz.de/staff/jan/nted/sources/$pkgbase-$pkgver.tar.gz"
        "${_deb_url}/gtk3.patch"
        "${_deb_url}/automake.patch"
        "${_deb_url}/remove-encoding-key-in-desktop-file"
        "${_deb_url}/linking"
        "${_deb_url}/doc-requirements"
        "${_deb_url}/empty_page_reposit.patch"
        "${_deb_url}/fix-empty-captions.patch"
        "${_deb_url}/g++-4.7.patch"
        "${_deb_url}/Werror.patch"
        "${_deb_url}/fix-midi-import.patch"
        "${_deb_url}/fix-signage-of-char-arrays.patch"
        "${_deb_url}/series"
)
sha256sums=('808df3c851dbc4b24efdbf96c4e6ed28152deb301c4373268831f2a243e8f1ac'
            'a0381a01348e9a09e43958cd7d57a138828cfd60e0b12bcb2c0b6771cca3e580'
            '2d6494363edd25c70aa596f1c098cb428572e8edf90c625abd445add6f9b6dd2'
            '4ec9fab668621c6cd0a34a04b1ad988ea6fd592e20cbbfe2156379341cd6a009'
            '727502f1d44179d68028c048960d1ed85586ef843601c9e0ef4f6ff52ca60248'
            'c23727c130055ec1fde9d961917422e867fd944eca204a6be140e3ef59f53ff5'
            '5cb47e4e5c7310f26d41e8cc6a5f0cd51dffa65d6f545afcea8b6474d16f567d'
            'e897fc06cd0dbd5372473f06638257e9f009df08a2dfe4e8448655f544e52f39'
            '9f5626f15f58627d70f4eb67228d41a230526463b87df979e40166df38d0567d'
            'd3966f610a68335ddaabdf7188ac67ea3ff028074aeacdffeb4a0183ebe517b0'
            '63ab3ae361c575ec78feda32f728b3d5e872f643514eae37d549416a83d1f709'
            '86ad2b6290ca59ba53521868107b458117a9c2cf79e1aea4e5b8a616300545ff'
            '622599ba493ef7849ca324d01aee39f7595fb5182184f340cb70634f370717e2')

prepare() {
  cd $pkgbase-$pkgver

  # Debian patches
  while IFS= read -r patch; do
    patch -Np1 -i "$srcdir/${patch}"
  done < "$srcdir/series"

  mv -f configure.in configure.ac

  # Fix icon & remove deprecated category
  desktop-file-edit --set-icon="$pkgbase" --remove-category=Application \
    "datafiles/applications/$pkgbase.desktop"
}

build() {
  cd "$pkgbase-$pkgver"
  aclocal
  automake --add-missing
  autoreconf
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgbase-$pkgver"
  desktop-file-validate "datafiles/applications/$pkgname.desktop"
}

package_nted () {
  pushd "$pkgbase-$pkgver"
  make DESTDIR="$pkgdir" install
  popd

  mkdir -p doc/usr/share
  mv {"$pkgdir",doc}/usr/share/doc/
}

package_nted-docs () {
  pkgdesc+=" (HTML Documentation)"
  depends=()

  mv doc/* "$pkgdir/"
}
