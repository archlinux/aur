# Maintainer: Robert Manner <the_manni at users.sf.net>
# Original package recipe is from Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>, thanks!

_Name="PassKeeZ"
pkgname="${_Name,,}"
pkgver=0.6.2
pkgrel=1
pkgdesc="FIDO2/Passkey compatible authenticator implementation"
arch=('aarch64' 'x86_64')
url="https://github.com/Zig-Sec/${_Name}"
license=('custom:None')
depends=('zigenity')
makedepends=('zig>=0.15.0' 'zig<0.16.0')
_pkgsrc="${_Name}-${pkgver}"
noextract=()
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgname}.sysusers"
        "${pkgname}.modules-load")
b2sums=('f409074522b441e658150bc77ce7b83ba8255955fd228df945dbe0d488e5ebdbedd0c99ce5bf596b2ffebcbaa4b4010c4aa9890c2f83809f1aaad670dd2e7719'
        '5c504e5e2beefe9fb56170135061f62c3413c156349cee1fa32dfa25a806ac40c0b3b0474b644664eaf7f05212b8071cf1646f94dc54f30e8b730c3ae09b9aef'
        'c35e85734037b87f4269fcc120442818630f64ad5a07899e4b7452bfa4407b6a87b940c223a4259b9b4360bff5380920a129462fb330c5eb517c987efc4362fc')
 
build() {
  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="build" zig build \
    --summary all \
    --prefix /usr \
    --search-prefix /usr \
    --global-cache-dir "${srcdir}/zig-global-cache" \
    --verbose \
    -Doptimize=ReleaseSmall
}

package() {
  cd "${srcdir}"
  install -vDm644 "${pkgname}.sysusers"     "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -vDm644 "${pkgname}.modules-load" "${pkgdir}/usr/lib/modules-load.d/${pkgname}.conf"

  cd "${_pkgsrc}"
  cp -va build/* "${pkgdir}"

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "src/static/"*.png --target-directory="${pkgdir}/usr/share/passkeez"
  # install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  find "script" -type f -name '*.rules'   -execdir \
    install -vDm644 "{}" "${pkgdir}/usr/lib/udev/rules.d/{}" \;
  find "script" -type f -name '*.service' -execdir \
    install -vDm644 "{}" "${pkgdir}/usr/lib/systemd/user/{}" \;
}
