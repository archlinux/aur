# Maintainer: Gurov <thuggerthugger1@duck.com>
pkgname=cups-filters-legacy
pkgver=1.28.17
pkgrel=1
pkgdesc="Legacy OpenPrinting CUPS Filters 1.x for classic PPD printer drivers"
arch=('x86_64')
url="https://github.com/OpenPrinting/cups-filters"
license=('BSD-4-Clause AND GPL-2.0-only AND GPL-2.0-or-later AND GPL-3.0-only AND GPL-3.0-or-later AND LGPL-2.0-only AND LGPL-2.1-or-later AND MIT')

provides=(
  "cups-filters=${pkgver}"
  "cups-browsed=${pkgver}"
)

conflicts=(
  'cups-browsed'
  'cups-filters'
  'libcupsfilters'
  'libppd'
)

depends=(
  'avahi'
  'dbus'
  'fontconfig'
  'freetype2'
  'glib2'
  'ijs'
  'lcms2'
  'libcups>=2.2.6-2'
  'libexif'
  'libjpeg-turbo'
  'libpng'
  'libtiff'
  'poppler'
  'qpdf'
)

makedepends=(
  'ghostscript'
  'glib2-devel'
  'liblouis'
  'mupdf-tools'
  'python'
)

optdepends=(
  'antiword: Microsoft Word conversion for Braille support'
  'docx2txt: DOCX conversion for Braille support'
  'foomatic-db: printer definitions for Foomatic'
  'foomatic-db-engine: Foomatic printer driver support'
  'foomatic-db-nonfree: additional non-free Foomatic printer definitions'
  'ghostscript: PostScript/PDF conversion and rasterization'
  'imagemagick: Braille embosser support'
  'liblouis: Braille embosser support'
  'mupdf-tools: MuPDF-based PDF rasterization'
)

backup=('etc/cups/cups-browsed.conf')

# openSUSE's maintained cups-filters 1.28.x compatibility/security patches
_obs_p="https://api.opensuse.org/public/source/Printing/cups-filters"

# Debian's maintained cups-filters 1.28.17 security patch series
_deb_p="https://sources.debian.org/data/main/c/cups-filters/1.28.17-7/debian/patches"

source=(
  "https://github.com/OpenPrinting/cups-filters/releases/download/${pkgver}/cups-filters-${pkgver}.tar.xz"

  # CVE-2023-24805: beh command injection
  "cups-filters-CVE-2023-24805.patch::https://github.com/OpenPrinting/cups-filters/commit/93e60d3df358c0ae6f3dba79e1c9684657683d89.patch"

  # qpdf 12 compatibility
  "${_obs_p}/cups-filters-qpdf12.patch"

  # 2024 security fixes
  "${_obs_p}/cups-filters-1.28.17-CVE-2024-47076.patch"
  "${_obs_p}/cups-filters-1.28.17-CVE-2024-47175.patch"
  "${_obs_p}/cups-filters-1.28.17-CVE-2024-47176.patch"

  # 2025 security fixes
  "CVE-2025-57812-1.patch::${_deb_p}/CVE-2025-57812-1.patch"
  "CVE-2025-57812-2.patch::${_deb_p}/CVE-2025-57812-2.patch"
  "CVE-2025-57812-3.patch::${_deb_p}/CVE-2025-57812-3.patch"
  "CVE-2025-57812-4.patch::${_deb_p}/CVE-2025-57812-4.patch"
  "CVE-2025-57812-5.patch::${_deb_p}/CVE-2025-57812-5.patch"
  "CVE-2025-64503.patch::${_deb_p}/CVE-2025-64503.patch"
  "CVE-2025-64524.patch::${_deb_p}/CVE-2025-64524.patch"

  # systemd hardening for cups-browsed
  "${_obs_p}/harden_cups-browsed.service.patch"
)

sha256sums=('270a3752a960368aa99d431fb5d34f4039b2ac943c576d840612d1d8185c9bb9'
            'c79f9bb558ce02117c09c461d760844d5de79e7f753a48971bb5f9aed1a9f913'
            'e6b2425f241931cd68f7ec8fe8c0cb35294dc49258e8854a53a814f4e13a90f5'
            '4c83794ec044842cfec1b9906aca9f64c08aee7a280fbe28a29e08dbe0eaccf2'
            '77d582c3422839d9a5d8242f0fdf62f7cfd251056e3016f7f733be1dab6ecb9c'
            '95fc35c48b11c802838f64d50507eef9eeab38f9daf49c0fb56fe6da55e1a247'
            'ee9fd264db9360368e91eb39b293f1c68b3ffcc8303b07fdbedc8add7339d0c2'
            '3db9ab993f2d90981f4fb77a27241025a9b5e9f74d52b616af746e47aab0c188'
            'c60c80418b993f27b7c60b7caed57a17ed2050eb4448826082bcf0c5ae8d1ac3'
            '9d7cd2afb5da6147eba085df5f6925b08d81dce10b37ed77cdc777869e720c6a'
            '2cbafc283cbbf211500c99e805a685404d11cb18c5e16b4626f4cb4203dfbf60'
            'cbb28d664ef3a876352afad22e411a3a06a16c607c71389191c1067af5fca111'
            'f46d54221942e2257c78c2cc4055b9902522a375ebc801528a72aedd37108dd5'
            '4d3c902f9cea37f9bbb747f530ecae7b0ff9172bb7fa99058801a10e1c9c3608')

prepare() {
  cd "${srcdir}/cups-filters-${pkgver}"

  # CVE-2023-24805
  patch -Np1 -i "${srcdir}/cups-filters-CVE-2023-24805.patch"

  # 2024 security fixes
  patch -Np1 -i "${srcdir}/cups-filters-1.28.17-CVE-2024-47076.patch"
  patch -Np1 -i "${srcdir}/cups-filters-1.28.17-CVE-2024-47175.patch"
  patch -Np1 -i "${srcdir}/cups-filters-1.28.17-CVE-2024-47176.patch"

  # 2025 security fixes
  patch -Np1 -i "${srcdir}/CVE-2025-57812-1.patch"
  patch -Np1 -i "${srcdir}/CVE-2025-57812-2.patch"
  patch -Np1 -i "${srcdir}/CVE-2025-57812-3.patch"
  patch -Np1 -i "${srcdir}/CVE-2025-57812-4.patch"
  patch -Np1 -i "${srcdir}/CVE-2025-57812-5.patch"
  patch -Np1 -i "${srcdir}/CVE-2025-64503.patch"
  patch -Np1 -i "${srcdir}/CVE-2025-64524.patch"

  # qpdf 12 compatibility
  patch -Np1 -i "${srcdir}/cups-filters-qpdf12.patch"

  # systemd sandbox hardening
  patch -Np1 -i "${srcdir}/harden_cups-browsed.service.patch"

  # Security patches modify autotools inputs.
  ./autogen.sh
}

build() {
  cd "${srcdir}/cups-filters-${pkgver}"

  # Required for current GCC.
  CFLAGS+=" -std=gnu11"

  # openSUSE's qpdf 12 compatibility patch uses qpdf's old API
  # through its transition compatibility mode.
  CXXFLAGS+=" -std=c++17 -DPOINTERHOLDER_TRANSITION=0"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    --with-rcdir=no \
    --enable-avahi \
    --with-browseremoteprotocols=DNSSD

  make
}

package() {
  cd "${srcdir}/cups-filters-${pkgver}"

  make DESTDIR="${pkgdir}" install

  # cups-filters 1.x doesn't install its systemd unit automatically.
  install -Dm644 \
    utils/cups-browsed.service \
    "${pkgdir}/usr/lib/systemd/system/cups-browsed.service"

  # cups-browsed is installed under /usr/bin on Arch.
  sed -i \
    's|/usr/sbin/cups-browsed|/usr/bin/cups-browsed|' \
    "${pkgdir}/usr/lib/systemd/system/cups-browsed.service"

  # Remove obsolete Upstart configuration.
  rm -rf "${pkgdir}/etc/init"

  install -Dm644 \
    COPYING \
    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
