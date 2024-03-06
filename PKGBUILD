# Maintainer: Philipp Claßen <philipp.classen@posteo.de>
# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=ghostery-browser-bin
_vendorname=ghostery-browser
_shortname=ghostery
# Change the following variable to 'fr' or 'de' to build the German or French version.
# Warning: Don't forget to also change the first sha256sum hash with the
# correct version below
_lang=en-US
pkgver=2024.03
_builddate=2024-03-06
pkgrel=1
pkgdesc="Privacy aware web browser from Ghostery (binary release)."
arch=('x86_64')
url="https://www.ghostery.com/ghostery-private-browser"
license=('MPL2')
provides=(ghostery-browser)
conflicts=(ghostery-browser ghostery-dawn-bin)
replaces=(ghostery-dawn-bin)
depends=(dbus-glib gtk2 gtk3 libxt nss)
optional=(firejail)
install=install
source=("https://github.com/ghostery/user-agent-desktop/releases/download/${_builddate}/Ghostery-${pkgver}.${_lang}.linux.tar.gz"
        "https://raw.githubusercontent.com/ghostery/user-agent-desktop/master/LICENSE"
        "https://raw.githubusercontent.com/ghostery/ghostery-browser-linux-support/main/data/${_vendorname}.desktop"
        "ghostery.profile")
sha256sums=('989123c5e8704bbf011746a5e70c989be9667654b2282bc4e6031cb019174dd4'
            '1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5'
            '9ee052fb8a96cecd4b9e6686a189cb84793c8e72c1d30bc2b6eddc9a30b93d72'
            'dbdfb7e32bb874d6b0c67b10524508620e2137662b7f928750f41f0df926040f')
# Hash to use with en-US: 989123c5e8704bbf011746a5e70c989be9667654b2282bc4e6031cb019174dd4
# Hash to use with de: 96d0e1cec66048b84b2a635d77a7be2e6a28924ed01d8f7f0fad6eedfb229bc5
# Hash to use with fr: abb4071fe60253498d443a4697922f236e9fe4a2527b86c15f2743a07f6e965e

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
