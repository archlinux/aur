# Maintainer : 00ein00 <Ein420@proton.me>

HNCDIR=opt/hnc
HNCCONTEXT=opt/hnc/hoffice11/Bin/qt/plugins/platforminputcontexts
NIMFLIB=libqt5im-nimf.so
KIMELIB=libkime-qt-5.11.3.so

DLAGENTS=("https::/usr/bin/wget -N --timestamping %u")

pkgname='hoffice-hwp'
pkgver=11.20.0.1520
pkgrel=4
pkgdesc='.HWP/HWPX Office document editor for Linux, excluding the Hancom Office suite and only installs hoffice-hwp editor.'
arch=('x86_64')
source=(
  'https://dl.dropbox.com/scl/fi/288hastrkhbhtnv9qblhd/1732214553_hoffice-hwp_11.20.0.989_amd64.deb?rlkey=ytc0p85vam1q01wa17xaasw0x&st=669rlhj0&dl=0'
  'LICENSE'
  'libqt5im-nimf.so'
)

url='https://www.hancom.com'

license=('custom:hoffice')
makedepends=('wget')
depends=('cairo' 'fontconfig' 'freetype2' 'gcc-libs' 'glibc' 'glu' 'harfbuzz' 'harfbuzz-icu' 'libcups' 'libcurl-gnutls' 'libxcb' 'openssl-1.1' 'qt5-base' 'qt5-x11extras' 'zlib')
provides=('hoffice-hwp=${pkgver}')
conflicts=('hoffice-2022-beta' 'hoffice')
install=hoffice-hwp.install
sha256sums=('04299dfe60458d42c0f77b3aeece0eeda3cfcedbcd077d55a3b795662bc6b3ae'
  '09b74399a45cde2b28e672784dbd1eb6397454a025e05a51fb3367eadb834583'
  'd246c02a20a1e4ea123f9c2275dfc4a2ea091a65032ddbbe8a59bfc71418f60c')

pre_remove() {
  if [[ -f "/${HNCCONTEXT}/${NIMFLIB}" ]]; then
    rm -vf "/${HNCCONTEXT}/${NIMFLIB}"
    rm -rf "/${HNCDIR}"
  fi
}

post_remove() {
  xdg-icon-resource forceupdate --theme hicolor &>/dev/null
  update-desktop-database -q
}

package() {

  curl -# -o "${srcdir}/${KIMELIB}" -fL 'https://github.com/Riey/kime/releases/latest/download/libkime-qt-5.11.3.so'

  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/hoffice" "${srcdir}/LICENSE"

  if [ -f "${srcdir}/${KIMELIB}" ] && [ -f "${srcdir}/${NIMFLIB}" ]; then
    install -Dm755 -t "${pkgdir}/${HNCCONTEXT}" "${srcdir}/${KIMELIB}"
    install -Dm755 -t "${pkgdir}/${HNCCONTEXT}" "${srcdir}/${NIMFLIB}"
  fi

  mkdir -p "$pkgdir"/usr/bin/
  echo "Creating symbolic link: /opt/hnc/hoffice11/Bin/hwp -> /usr/bin/hwp"
  echo '"/opt/hnc/hoffice11/Bin/hwp" $@' >"$pkgdir"/usr/bin/hwp
  chmod +x "$pkgdir"/usr/bin/hwp
}
