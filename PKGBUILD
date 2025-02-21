# Maintainer : 00ein00 <Ein420@proton.me>

HNCDIR=opt/hnc
HNCCONTEXT=opt/hnc/hoffice11/Bin/qt/plugins/platforminputcontexts
NIMFLIB=libqt5im-nimf.so
KIMELIB=libkime-qt-5.11.3.so

DLAGENTS=("https::/usr/bin/wget -N --timestamping %u")

pkgname='hoffice'
pkgver=11.20.0.1520
pkgrel=4
pkgdesc='Office document editor for Linux. Hancom Office Editor is an application to allow you to edit office documents that is developed and distributed by Hancom Inc. 
         / 본 어플리케이션은 리눅스용 문서 편집 프로그램으로, 한컴에 의해 개발되고 배포된 형식의 문서들을 편집할 수 있도록 해주는 프로그램입니다.'
arch=('x86_64')
source=(
  'https://dl.dropbox.com/scl/fi/ia3ub05nti01h8lzb3vwr/1732118678_hoffice_11.20.0.1520_amd64.deb?rlkey=8bnxl9chpm7rt6sr6nc4eoqp0&st=yaxlb481&dl=0'
  'LICENSE'
  'libqt5im-nimf.so'
)

url='https://www.hancom.com'

license=('custom:hoffice')
makedepends=('wget')
depends=('cairo' 'fontconfig' 'freetype2' 'gcc-libs' 'glibc' 'glu' 'harfbuzz' 'harfbuzz-icu' 'libcups' 'libcurl-gnutls' 'libxcb' 'openssl-1.1' 'qt5-base' 'qt5-x11extras' 'zlib')
provides=('hoffice=${pkgver}')
conflicts=('hoffice-hwp')
install=hoffice.install

sha256sums=('1ecb2f82e915b49706d1f5f6d206f8bd4a9384fda2bd56798c94046865fe5730'
  '09b74399a45cde2b28e672784dbd1eb6397454a025e05a51fb3367eadb834583'
  'd246c02a20a1e4ea123f9c2275dfc4a2ea091a65032ddbbe8a59bfc71418f60c')

pre_remove() {
  echo "Removing installed files..."
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
  echo "Creating symbolic link: /opt/hnc/hoffice11/Bin/hsl -> /usr/bin/hsl"
  echo '"/opt/hnc/hoffice11/Bin/hsl" $@' >"$pkgdir"/usr/bin/hsl
  chmod +x "$pkgdir"/usr/bin/hsl
  echo "Creating symbolic link: /opt/hnc/hoffice11/Bin/hword -> /usr/bin/hword"
  echo '"/opt/hnc/hoffice11/Bin/hword" $@' >"$pkgdir"/usr/bin/hword
  chmod +x "$pkgdir"/usr/bin/hword
  echo "Creating symbolic link: /opt/hnc/hoffice11/Bin/hcl -> /usr/bin/hcl"
  echo '"/opt/hnc/hoffice11/Bin/hcl" $@' >"$pkgdir"/usr/bin/hcl
  chmod +x "$pkgdir"/usr/bin/hcl

}
