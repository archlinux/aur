# Maintainer: xpufx <github@xpufx.com>

pkgname=paseo-cli-edge
_pkgname=cli
_npmscope=@getpaseo
pkgver=0.11.0
_tarball_sha='823040e94cd7d1ad631e8248e2d05d2bb647a1610f33bfe574abc4d37b7d129b'
_license_sha='79d5aedce6aa0adc547336dc1bd34c5cc9308ba110fac7079ed97515ee573ad3'
pkgrel=1
# Publish targets: aur + Arch release + Debian release (opt-in per format).
_publish_targets="aur github-arch github-deb"
# Debian runtime deps for the fpm conversion, translated from depends:
#   glibc->libc6, gcc-libs->libgcc-s1 + libstdc++6 (bundled native node
#   addons link libgcc_s/libstdc++), nodejs->nodejs, bash->bash. Upstream
#   git builds want Node >=22; no Debian stable / Ubuntu LTS repo carries
#   that, so the version pin stays Arch-only rather than make the .deb
#   uninstallable on deb-smoke.
_deb_depends=('libc6' 'libgcc-s1' 'libstdc++6' 'nodejs' 'bash')
pkgdesc='Command-line interface for controlling Paseo AI coding agents (edge - latest upstream release, beta or stable)'
arch=('x86_64' 'aarch64')
url='https://github.com/getpaseo/paseo/tree/main/packages/cli'
license=('Apache-2.0')
depends=('nodejs' 'bash' 'glibc' 'gcc-libs')
makedepends=('npm')
provides=('paseo')
conflicts=('paseo' 'paseo-bin' 'paseo-cli-bun' 'paseo-cli')
source=("${_pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmscope}/${_pkgname}/-/${_pkgname}-${pkgver//_/-}.tgz"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/getpaseo/paseo/v${pkgver//_/-}/LICENSE")
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=("$_tarball_sha"
            "$_license_sha")
options=('!strip')

package() {
    npm install \
        --omit=dev \
        --no-audit \
        --no-fund \
        --cache "${srcdir}/npm-cache" \
        --prefix "${pkgdir}/usr/lib/${pkgname}" \
        "${srcdir}/${_pkgname}-${pkgver}.tgz"

    rm -f "${pkgdir}/usr/lib/${pkgname}/package.json" \
        "${pkgdir}/usr/lib/${pkgname}/package-lock.json"
    grep -rlZ '^#!.*node' "${pkgdir}/usr/lib/${pkgname}/node_modules" \
        | xargs -0 -r sed -i '1{/^#!/d}'
    find "${pkgdir}/usr/lib/${pkgname}/node_modules" -type f -perm /111 -exec chmod 644 {} +

    # restore execute on esbuild binary (blanket chmod above stripped it)
    case "${CARCH}" in
        x86_64) _esbuild_arch=linux-x64 ;;
        aarch64) _esbuild_arch=linux-arm64 ;;
    esac
    chmod 755 "${pkgdir}/usr/lib/${pkgname}/node_modules/@esbuild/${_esbuild_arch}/bin/esbuild" 2>/dev/null || true

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/paseo" <<'WRAPPER'
#!/bin/sh
exec /usr/bin/node /usr/lib/paseo-cli-edge/node_modules/@getpaseo/cli/bin/paseo "$@"
WRAPPER

    rm -rf "${pkgdir}/usr/lib/${pkgname}/etc" \
        "${pkgdir}/usr/etc"

    case "${CARCH}" in
        x86_64) _node_pty_prebuild=linux-x64 ;;
        aarch64) _node_pty_prebuild=linux-arm64 ;;
    esac
    while IFS= read -r -d '' _pty_prebuilds; do
        find "$_pty_prebuilds" -mindepth 1 -maxdepth 1 -type d \
            ! -name "${_node_pty_prebuild}" -exec rm -rf {} +
    done < <(find "${pkgdir}/usr/lib/${pkgname}/node_modules" -type d \
        -path '*/node-pty/prebuilds' -print0)


    chmod -R go-w "${pkgdir}/usr"
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +
    chown -R root:root "${pkgdir}"

    install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
