# Maintainer: Alexei Colin <ac at alexeicolin dot com>
# Contributor: Maxim Baz <archlinux at maximbaz dot com>

pkgname=parcel
pkgver=1.0.6
pkgrel=2
pkgdesc="Native host for Parcel browser extension for zx2c4's pass password manager"
arch=('any')
url="https://github.com/parcel-pm/${pkgname}"
license=('ISC')
depends=('jq' 'gnupg' 'openssl')
makedepends=()
optdepends=("parcel-firefox: browser extension for Firefox"
            "parcel-chromium: browser extension for Chromium")
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
sha256sums=('7392e28b0c25b11a689008edcb27c2d8fbc87f28c3cdc79ccb866e238fe76004'
            'SKIP')
validpgpkeys=('82ED663067C6017BAA4BC752EB670BF2B1131683'
              'B0908ED59A96C9882BED9A942A51761511A30253'
              '88FF14D6294AF4036B7F00FF676A3C09E2E47A72'
              '56C3E775E72B0C8B1C0C1BD0B5DB77409B11B601')

# The host script is bundled with the browser extension, and provided by the
# web extension "dynamically" for execution to the wrapper script (also named
# parcel-host but a different script), which runs outside the browser sandbox
# on the host. This is a potentially dangerous escape path from the browser
# sandbox that could allow execution of arbitrary code in your system at user
# credentials, outside the browser, if the supply chain of the browser
# extension is compromized and a malicious host script is bundled with the
# extension (e.g. in case of compromized keys of the upstream developers that
# sign the extension release, or a long con by the developers themselves).
#
# The hash pinning feature protects against this scenario by allowing only a
# known pre-approved host script contents. The source code is still
# "dynamically" provided by the extension, but only one particular source code
# would be accepted. This feature is disabled by default, but the upstream
# documentation "strongly" recommends users enable it. For your safety, this
# package enables the feature by default, by modifying the default config
# template.  Note this config template is relevant only for the first
# installation of this package; for all subsequent updates, the relevant config
# is onl ythe user's parcelrc.
#
# Sidenote: you may wonder why not just install the host script into the system
# instead of bundling it with the extension and having to plug the security
# hole with a hashing ceremony? Ask upstream. Presumably, they want to be able
# to update the extension in the browser without having to update software
# installation on the host. But, this requirement seems not relevant to Arch,
# where package update is seamless. Perhaps upstream could consider a
# "pre-installed-script-only" mode for distros where this would be practical.
#
# When the extension package (parcel-firefox, parcel-chrome) is updated, you
# will need to review the new host script (bundled with the extension), and if
# satisfied with the lack of any backdoors, then update the hash pinned in
# ~/.config/parcel/parcelrc to the hash of the new bundled host script.
#
# The hash is on the file extracted from the extension archive [.xpi, .crx],
# (not the wrapper script file of the same name installed by this package):
#     sha256sum parcel-host
_default_host_hash=95c6269ad110048ef5020a63318acbcfebc325725cb6cb38fb2683fb41813776

prepare() {
    cd "${pkgname}-${pkgver}"

    # Harden the *default* config template by enabling:
    # * host script hash pinning feature
    # * signers whitelist
    #    - negligible benefit since wrapper script defaults to the
    #      same list when no whitelist in user config
    local _ph_hash="1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef"
    sed -i -e "s/^#HOST_HASH=\"${_ph_hash}\"$/HOST_HASH=\"${_default_host_hash}\"/" \
           -e "s/^#VALID_SIGNERS=/VALID_SIGNERS=/" \
            parcel-host
    echo ">>> Pinned parcel-host script hash in default config template to:"
    echo ">>>    ${_default_host_hash}"
    echo ">>> Enabled default whitelist for parcel-host script signing keys"
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm755 "parcel-host" "${pkgdir}/usr/bin/parcel-host"

    # Install manifests so that browser extension pkgs can link to them
    local _manifest_id="com.github.erayd.parcel"
    local _browser
    for _browser in "firefox" "chrome"
    do
        sed -i 's@/usr/local@/usr@' "example/${_manifest_id}.${_browser}.json"
        install -Dm644 "example/${_manifest_id}.${_browser}.json" \
            "${pkgdir}/usr/lib/parcel/hosts/${_browser}/${_manifest_id}.json"
    done
}

# vim:set ts=4 sw=4 et:
