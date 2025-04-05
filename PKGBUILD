# Maintainer:  
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="PassKeeZ"
pkgname="${_Name,,}"
pkgver=0.4.0
pkgrel=1
pkgdesc="FIDO2/Passkey compatible authenticator implementation"
arch=('aarch64' 'x86_64')
url="https://github.com/Zig-Sec/${_Name}"
license=('custom:None')
depends=('glibc')
makedepends=('zig')
_pkgsrc="${_Name}-${pkgver}"
_zig_deps=(
  # passkeez
  "keylib-0.5.3.tar.gz::https://github.com/r4gus/keylib/archive/refs/tags/0.5.3.tar.gz"
  "ccdb-0.2.0.tar.gz::https://github.com/r4gus/ccdb/archive/refs/tags/0.2.0.tar.gz"

  # keylib
  "zbor-0.15.0.tar.gz::https://github.com/r4gus/zbor/archive/refs/tags/0.15.0.tar.gz"
  # "r4gus-hidapi-master.tar.gz::https://github.com/r4gus/hidapi/archive/master.tar.gz"
  "r4gus-hidapi-e84e03117f92c65a03afe8a4c67a0a9877b9c024.tar.gz::https://github.com/r4gus/hidapi/archive/e84e03117f92c65a03afe8a4c67a0a9877b9c024.tar.gz"
  "uuid-zig-0.2.1.tar.gz::https://github.com/r4gus/uuid-zig/archive/refs/tags/0.2.1.tar.gz"
  # ccdb
  # "zbor-0.15.0.tar.gz::https://github.com/r4gus/zbor/archive/refs/tags/0.15.0.tar.gz"
  # "uuid-zig-0.2.1.tar.gz::https://github.com/r4gus/uuid-zig/archive/refs/tags/0.2.1.tar.gz"
  "zig-clap-0.9.1.tar.gz::https://github.com/Hejsil/zig-clap/archive/refs/tags/0.9.1.tar.gz"
)
noextract=("${_zig_deps[@]%%::*}")
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgname}.sysusers"
        "${pkgname}.modules-load"
        "${_zig_deps[@]}")
b2sums=('c849c0658a0c075220b502d2f069cadf69dfc44426f9e82080a961f739dc392fb0912b1fe105f3d2f38e11d90669ee896796fd4fa39e39fe30e49c03f2825e90'
        '5c504e5e2beefe9fb56170135061f62c3413c156349cee1fa32dfa25a806ac40c0b3b0474b644664eaf7f05212b8071cf1646f94dc54f30e8b730c3ae09b9aef'
        'c35e85734037b87f4269fcc120442818630f64ad5a07899e4b7452bfa4407b6a87b940c223a4259b9b4360bff5380920a129462fb330c5eb517c987efc4362fc'
        '2da0726249c6b518965cb87767ea0bdefda7ce59fe84a94fe3da04e52312c8e3b9adb89216073de6ad3ea8f5ea595e35c4fc527b613d7e42b6861ad83185fef9'
        '35271ba2f5a1ccac38147d763b80406771fde4218b2370a164381fde0fca3d68bf195343663f447b9729a9d1b837a10dde05cd8541079e6ae99cf6dde17d3fe6'
        'c34a1060e6d523af39d190b29abf65877edc9e20678f5bae253370b296d618613a0098e26e6bca830adf23ce372e7bd896210d57df821242a3a36f8a448c6bad'
        '1acf2e2ab8f010c05fe771f6c4a31c063a371fb637a4c71b5aabbd14ad6271b669e64807382a72a0c14c7fda412b1d3180cd8dd4064df1b5510120075dfccf05'
        '4bb9d23ad302edf9f27974dabf75a6487af195003fcf46378aa748e6f6e61b63dd0bd827ff2c53fb72e1d3172f96045e65d8467978288d4c6ce531ab22bb9cd4'
        '685208b8cb08070304c44c8a1a294d53e7eb4045585a65d5ea3297c1d50157ec8cec06c1b21e3476e3cea0518945bc77b1cf4fe349f11ddcf9aa80dbfbd87788')
           
prepare() {
  cd "${srcdir}"
  for dep in "${_zig_deps[@]}"; do
    zig fetch --global-cache-dir ./zig-global-cache "${dep%%::*}"
  done
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="build" zig build \
    --summary all \
    --prefix /usr \
    --search-prefix /usr \
    --global-cache-dir "${srcdir}/zig-global-cache" \
    --system "${srcdir}/zig-global-cache/p" \
    --verbose \
    -Dtarget=native-linux.6.1-gnu.2.39 \
    -Dcpu=baseline \
    -Doptimize=ReleaseSafe
}

package() {
  cd "${srcdir}"
  install -vDm644 "${pkgname}.sysusers"     "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -vDm644 "${pkgname}.modules-load" "${pkgdir}/usr/lib/modules-load.d/${pkgname}.conf"

  cd "${_pkgsrc}"
  cp -va build/* "${pkgdir}"

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  # install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  find "script" -type f -name '*.rules'   -execdir \
    install -vDm644 "{}" "${pkgdir}/usr/lib/udev/rules.d/{}" \;
  find "script" -type f -name '*.service' -execdir \
    install -vDm644 "{}" "${pkgdir}/usr/lib/systemd/system/{}" \; 
}
