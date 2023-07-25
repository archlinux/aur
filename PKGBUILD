# Maintainer: Philipp Claßen <philipp.classen@posteo.de>
# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=ghostery-dawn-bin
_vendorname=ghostery-dawn
_shortname=ghostery
# Change the following variable to 'fr' or 'de' to build the German or French version.
# Warning: Don't forget to also change the first sha256sum hash with the
# correct version below
_lang=en-US
pkgver=2023.6
_builddate=2023-07-21
pkgrel=1
pkgdesc="Privacy aware web browser from Ghostery (binary release)."
arch=('x86_64')
url="https://www.ghostery.com/ghostery-private-browser"
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
sha256sums=('84bbd2221172e4b78fc88c8f9c46af0a43c8cc9e08d33ec32e7e35334b9e8609'
            '1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5'
            '9b442a245fda8245271ce7b68de6d0756a5cbed19255125f1068395455798e94'
            'dbdfb7e32bb874d6b0c67b10524508620e2137662b7f928750f41f0df926040f')
# Hash to use with en-US: 84bbd2221172e4b78fc88c8f9c46af0a43c8cc9e08d33ec32e7e35334b9e8609
# Hash to use with de: 2a794ce3de918ab25dae59d8106117be35e08ccd469c11984a8aef9d3d5735c2
# Hash to use with fr: d552c93c23905f396d4e220b1a27ba0837ce0879adeeb6353c6b4d2dc0dd0cac

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
