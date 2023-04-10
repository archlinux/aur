# Maintainer: sukanka <su975853527 at gmail dot com>


pkgname=baidu-translate-client-bin
_pkgname=baidu-translate-client
pkgver=1.6.1
pkgrel=1
pkgdesc="baidu translate "
arch=('x86_64' 'aarch64')
url="https://fanyi.baidu.com/"
license=('unknown')
depends=('electron11')
makedepends=('p7zip' 'icoutils' 'imagemagick')
provides=(${_pkgname} "baidu-translate")
source=(
  "${_pkgname}-${pkgver}.exe::https://fanyiapp.cdn.bcebos.com/fanyi-client/pkg/win/${pkgver}/%E7%99%BE%E5%BA%A6%E7%BF%BB%E8%AF%91_Setup_${pkgver}.exe"
  "$_pkgname.sh"
  "${_pkgname}.desktop"
)
sha512sums=('f71a122a79e5c08b442545ab41c7090b80afc56267d7f892755768c0ec9e8823dc19a7f58217c0e510f36493503d53acdb9de616a1de253fdac22268d90d4a7b'
            'aa355b8f4e9d7be24bd3ec6f25a22d127db6faba0acfd3a36c3e97a74c8ac3f3272cb8b5bc8003a1c686173794b1f12a2a4c9ab28de39e92d927b5b54a919e95'
            'e5a812e44922d8ac3cee4c0029d38ea21b610cce00711b82ff8ef6e98e9327292a9ce4d34d265744de048cb76863d12d557f3452fef645e7cb795d474135dd0d')


prepare(){
  cd $srcdir
  7z e ${_pkgname}-${pkgver}.exe -aoa
  wrestool -x --output=${srcdir} -t14 ${_pkgname}-${pkgver}.exe
  convert "*.ico" -thumbnail 16x16 -alpha on -background none -flatten "${_pkgname}.png"

  7z x app-64.7z resources/   -aoa
  rm -rf ${srcdir}/resources/*.exe
  cd ${srcdir}/resources/app.asar.unpacked/node_modules/@baidu/fanyi-iohook/builds/
  rm -rf electron-v85-{win32-{x64,ia32},darwin-{x64,arm64}}
}
package(){
    cd $srcdir
    install -Dm755 ${srcdir}/${_pkgname}.sh  ${pkgdir}/usr/bin/${_pkgname}
    install -Dm644 ${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
    install -Dm644 ${_pkgname}.png ${pkgdir}/usr/share/icons/hicolor/16x16/apps/${_pkgname}.png

    install -d ${pkgdir}/usr/lib/${_pkgname}/
    cp -r  ${srcdir}/resources/* ${pkgdir}/usr/lib/${_pkgname}/
    chmod -R a+rx ${pkgdir}/usr/lib/${_pkgname}/app.asar.unpacked/

}
# vim: ts=2 sw=2 et:
