# Maintainer: Philipp Claßen <philipp.classen@posteo.de>
# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=ghostery-dawn-bin
_vendorname=ghostery-dawn
_shortname=ghostery
# Change following variable to fr or de to build deutsch or french version
# Warning: Don't forget to also change the first sha256sum hash with the
# correct version bellow
_lang=en-US
pkgver=2022.8.2
_builddate=2022-12-12
pkgrel=2
pkgdesc="Privacy aware web browser from Ghostery (binary release)."
arch=('x86_64')
url="https://www.ghostery.com/dawn"
license=('MPL2')
provides=(ghostery-dawn)
conflicts=(ghostery-dawn)
depends=(dbus-glib gtk2 gtk3 libxt nss)
optional=(firejail)
install=install
source=("https://github.com/ghostery/user-agent-desktop/releases/download/${_builddate}/Ghostery-${pkgver}.${_lang}.linux.tar.gz"
        "https://raw.githubusercontent.com/ghostery/user-agent-desktop/master/LICENSE"
        "https://raw.githubusercontent.com/ghostery/ghostery-browser-linux-support/main/data/${_vendorname}.desktop"
        "ghostery.profile")
# Hash to use with en-US: dab32f80be4a50b475810bfabaf524c28f79a60703e72db2337180dda5167ca1
# Hash to use with de: 5fd034b9b6c45fad8c4b125f57faa36fed87478b49f621762d9d897382551c81
# Hash to use with fr: 5a1cb447a021596f51fa37c0445c7d93b27e9b3b929ab693ca45296ac816fd3e
sha256sums=('dab32f80be4a50b475810bfabaf524c28f79a60703e72db2337180dda5167ca1'
            '1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5'
            'ef652d37bf0e1c9087cba10ab41e5e8475ca8ce5a990b122b9bcdfd8f658af65'
            'dbdfb7e32bb874d6b0c67b10524508620e2137662b7f928750f41f0df926040f')

prepare() {
  # NOTE: the following line will be removed once related fix is integrated in
  # upstream repository
  sed -i 's|^StartupWMClass=ghostery$|StartupWMClass=Ghostery|' "${_vendorname}.desktop"
  sed -i "s|^Icon=.*\$|Icon=${_vendorname}|" "${_vendorname}.desktop"
  sed -i "s|\[TARGET\]|/usr/lib/${_shortname}|" "${_vendorname}.desktop"
}

package() {
  install -d -m755 "${pkgdir}/usr/lib"
  cp -R Ghostery "${pkgdir}/usr/lib/${_shortname}"

  install -D -m644 /dev/stdin "${pkgdir}/usr/lib/${_shortname}/distribution/policies.json" <<EOF
{
  "_origin_": "https://github.com/mozilla/policy-templates",
  "policies": {
    "DisableAppUpdate": true
  }
}
EOF

  for i in 16 32 48 64 128; do
    install -D -m644 Ghostery/browser/chrome/icons/default/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/${_vendorname}.png"
  done

  install -D -m644 -t "${pkgdir}/usr/share/applications" "${_vendorname}.desktop"

  install -D -m644 -t "${pkgdir}/etc/firejail" ghostery.profile
  install -D -m644 -t "${pkgdir}/usr/share/licenses/${_shortname}" LICENSE

  install -D -m755 /dev/stdin "$pkgdir/usr/bin/${_shortname}" <<END
#!/bin/sh
exec /usr/lib/${_shortname}/Ghostery "\$@"
END
}
