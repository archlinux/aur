# Maintainer: Alexei Colin <ac at alexeicolin dot com>
# Contributor: Maxim Baz <archlinux at maximbaz dot com>

pkgname=parcel
pkgver=1.0.8
pkgrel=1
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
sha256sums=('dfa9b6949678220773eb0cce6c12b17c22514b5684c44ebc0ab5ef43012d000f'
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
_default_host_hash=7f77a5cd5d28ea1c88b1783499293374914c66ffd0706182e465a8a2035d245e

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
           -e "s/^#BLACKLIST_SIGNERS=/BLACKLIST_SIGNERS=/" \
            parcel-host
    echo ">>> Pinned parcel-host script hash in default config template to:"
    echo ">>>    ${_default_host_hash}"
    echo ">>> Enabled default whitelist for parcel-host script signing keys"
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm755 "parcel-host" "${pkgdir}/usr/bin/parcel-host"

    # Install manifests so that browser extension pkgs can link to them
    cd example && find . -type f -name '*.json' \
        -exec sed -i 's@/usr/local@/usr@' {} \; \
        -exec install -Dm644 {} "${pkgdir}"/usr/lib/parcel/hosts/{} \;
}

# vim:set ts=4 sw=4 et:
