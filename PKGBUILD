# Maintainer: Robert Manner <the_manni at users.sf.net>
# Original package recipe is from Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>, thanks!

_Name="PassKeeZ"
pkgname="${_Name,,}"
pkgver=0.7.1
pkgrel=1
pkgdesc="FIDO2/Passkey compatible authenticator implementation"
arch=('aarch64' 'x86_64')
url="https://codeberg.org/r4gus/${_Name}"
license=('custom:None')
depends=('zigenity')
makedepends=('zig')
_pkgsrc="${pkgname}"
noextract=()
source=("${_pkgsrc}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "${pkgname}.sysusers"
        "${pkgname}.modules-load")
b2sums=('123d6c86373fb1ecf492ce00384e1fe1b2be91119d6d1f5dbb3e5da570281dfc20146e267f2a2cec7f99d45ee4d009dcec533071ae62e72819b14e91946771f1'
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
