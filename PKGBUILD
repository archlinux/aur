# Maintainer: Philipp Claßen <philipp.classen@posteo.de>
# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=ghostery-browser-bin
_vendorname=ghostery-browser
_shortname=ghostery
# Change the following variable to 'fr' or 'de' to build the German or French version.
# Warning: Don't forget to also change the first sha256sum hash with the
# correct version below
_lang=en-US
pkgver=2024.8.1
_builddate=2024-08-30
pkgrel=1
pkgdesc="Privacy aware web browser from Ghostery (binary release)."
arch=('x86_64')
url="https://www.ghostery.com/ghostery-private-browser"
license=('MPL-2.0')
provides=(ghostery-browser)
conflicts=(ghostery-browser ghostery-dawn-bin)
replaces=(ghostery-dawn-bin)
depends=(dbus-glib gtk2 gtk3 libxt nss alsa-lib)
optional=(firejail)
install=install
source=("https://github.com/ghostery/user-agent-desktop/releases/download/${_builddate}/Ghostery-${pkgver}.${_lang}.linux.tar.gz"
        "https://raw.githubusercontent.com/ghostery/user-agent-desktop/master/LICENSE"
        "https://raw.githubusercontent.com/ghostery/ghostery-browser-linux-support/main/data/${_vendorname}.desktop"
        "ghostery.profile")
sha256sums=('92f8b2d2a969efa8780436e07c45c1eb07229a5bc7cb0cfa3e4c9eb66dd19399'
            '1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5'
            '9ee052fb8a96cecd4b9e6686a189cb84793c8e72c1d30bc2b6eddc9a30b93d72'
            'dbdfb7e32bb874d6b0c67b10524508620e2137662b7f928750f41f0df926040f')
# Hash to use with en-US: 92f8b2d2a969efa8780436e07c45c1eb07229a5bc7cb0cfa3e4c9eb66dd19399
# Hash to use with de: 7ed6da60924872aa068564585af5da6cf983d75ec408abb5637e5806b0260e99
# Hash to use with fr: f5c3dfc92176aa80291274c3f3f2018662d4166c62b7ccce425cb6cacbfee97e

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
