# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: Paragoumba <aur at paragoumba dot fr>
# Contributor: Renaud Littolff <rlittolff@gmail.com>

# shellcheck shell=bash disable=SC2034,SC2164

pkgname=proton-pass
pkgver=1.43.0
pkgrel=2
pkgdesc="Open-source and secure identity manager"
arch=('aarch64' 'x86_64')
url="https://proton.me/pass"
license=('GPL-3.0-or-later')
depends=('bash' 'glibc' 'electron' 'libgcc' 'libxkbcommon')
makedepends=('go-yq' 'nodejs' 'pnpm' 'rust')
conflicts=('proton-pass-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ProtonMail/WebClients/archive/refs/tags/${pkgname}@${pkgver}.tar.gz"
        "proton-pass.desktop")
sha256sums=('4bec62194dfc4c7036a9a8af1229252f4f6bf98c42a5d4f05401d9970412f532'
            '1c5c6373a3e3be71e34e42fa6c7486601f04a645763496c5a808bc843456e0fc')

prepare() {
    cd WebClients-${pkgname}-${pkgver}

    # Remove a bunch of unnecessary Proton package dependencies in this case (discovered during non-frozen install)
    sed -i -e '/activation/d' -e '/calendar/d' -e '/docs-core/d' -e '/eslint-config-proton/d' \
        -e '/mail-renderer/d' -e "/\/nav/d" -e '/oxlint-config/d' -e '/payments-ui/d' \
        -e '/prettier-config-proton/d' -e '/stylelint-config-proton/d' package.json
    sed -i -e '/calendar/d' -e '/challenge/d' -e '/file-icons/d' -e '/mail/d' -e '/meet/d' \
        packages/components/package.json
    sed -i '/cross-storage/d' packages/key-transparency/package.json
    sed -i -e "/@proton\/calendar/d" -e "/@proton\/mail/d" packages/redux-shared-store/package.json

    sed -i '/sanitize/d' packages/{components,shared}/package.json
    sed -i '/test-api/d' packages/{components,features,payments,shared}/package.json
    sed -i '/eslint-config-proton/d' applications/pass/package.json applications/pass-desktop/package.json \
        packages/{account,app-context,atoms,chargebee,colors,components,features,hooks,i18n,icons}/package.json \
        packages/{jest-env,key-transparency,metrics,pack,pass,payments,polyfill,react-polymorphic-types}/package.json \
        packages/{react-redux-store,recovery-kit,redux-shared-store,redux-shared-store-types,redux-utilities}/package.json \
        packages/{shared,sieve,types,unleash,utils}/package.json
    sed -i '/oxlint-config/d' \
        packages/{key-transparency,redux-shared-store,redux-shared-store-types,redux-utilities}/package.json
    sed -i '/prettier-config-proton/d' applications/pass-desktop/package.json packages/pass/package.json
    sed -i '/vitest-config/d' packages/{key-transparency,shared}/package.json

    # Remove unnecessary package patches (this is an error in pnpm)
    sed -i -e '/web-llm/d' -e '/eslint-plugin-monorepo/d' pnpm-workspace.yaml

    # HACK: Patch out the resolution of problematic tpe packages
    yq -i '.packages |= with_entries(select(.key | test("@tpe/") | not))' pnpm-lock.yaml

    # Skip broken internal repo for protontech packages
    sed -i '/@protontech/d' .npmrc

    # HACK: Modify the Proton logger version for its dependents
    # (TODO: Probably remove this on next release which should have this package updated)
    sed -i 's@\^0\.0\.5@^1.0.0@' applications/*/package.json packages/*/package.json

    # Bypass pass-desktop-native build script (removes npm/rustup requirement and Rust target hardcoding)
    sed -i 's@build"@build:napi \&\& pnpm run build:host"@' applications/pass-desktop/package.json

    # Freeze the lockfile when building the Rust components (likely helps with reproducible builds)
    sed -i -e 's@\(host --release\)@\1 --locked@' -e 's@\(--no-js\)@\1 -- --locked@' applications/pass-desktop/native/package.json

    # Skip electron-forge in build step (needed for .asar size improvement below)
    sed -i 's@ && electron-forge package@@' applications/pass-desktop/package.json

    # Fix electron-forge freezing on package step (https://github.com/electron/forge/issues/4277)
    yq -i 'with(.overrides.extract-zip; . = "npm:@electron-internal/extract-zip@1.0.5" | . style = "single")' pnpm-workspace.yaml

    # HACK: Make the tray icon work under system Electron
    sed -i 's@process.resourcesPath@"/usr/share/proton-pass"@' applications/pass-desktop/src/main.ts
}

build() {
    cd WebClients-${pkgname}-${pkgver}/applications/pass-desktop

    # Make sure the installed packages state doesn't get modified
    export pnpm_config_verify_deps_before_run=false

    # Only explicitly define required packages for Pass to avoid downloading unnecessary dependencies
    local _pnpm_packages=(
        --workspace-packages 'applications/pass'
        --workspace-packages 'applications/pass-desktop'
        --workspace-packages 'applications/pass-desktop/native'
        --workspace-packages 'packages/account'
        --workspace-packages 'packages/app-context'
        --workspace-packages 'packages/atoms'
        --workspace-packages 'packages/chargebee'
        --workspace-packages 'packages/colors'
        --workspace-packages 'packages/components'
        --workspace-packages 'packages/features'
        --workspace-packages 'packages/global-types'
        --workspace-packages 'packages/hooks'
        --workspace-packages 'packages/i18n'
        --workspace-packages 'packages/icons'
        --workspace-packages 'packages/jest-env'
        --workspace-packages 'packages/jest-swc-preset'
        --workspace-packages 'packages/key-transparency'
        --workspace-packages 'packages/metrics'
        --workspace-packages 'packages/pack'
        --workspace-packages 'packages/pass'
        --workspace-packages 'packages/payments'
        --workspace-packages 'packages/polyfill'
        --workspace-packages 'packages/react-polymorphic-types'
        --workspace-packages 'packages/react-redux-store'
        --workspace-packages 'packages/recovery-kit'
        --workspace-packages 'packages/redux-shared-store'
        --workspace-packages 'packages/redux-shared-store-types'
        --workspace-packages 'packages/redux-utilities'
        --workspace-packages 'packages/shared'
        --workspace-packages 'packages/sieve'
        --workspace-packages 'packages/styles'
        --workspace-packages 'packages/types'
        --workspace-packages 'packages/unleash'
        --workspace-packages 'packages/utils'
    )

    # preinstall script is ran from a mysterious missing utilities directory
    pnpm install --fix-lockfile --no-runtime --ignore-scripts "${_pnpm_packages[@]}"

    pnpm run build:desktop

    # HACK: Move Rust target directory to avoid asset-relocator including it (reduces size of .asar file)
    {
        mv native/target ../rust-target
        pnpm exec cross-env-shell NODE_ENV=production electron-forge package
        mv ../rust-target native/target
    }
}

package() {
    cd WebClients-${pkgname}-${pkgver}/applications/pass-desktop

    # Copy the main application archive/assets
    install -d "${pkgdir}"/usr/share/${pkgname}
    cp -ar "out/Proton Pass-linux-"*/resources/* -t "${pkgdir}"/usr/share/${pkgname}

    # Set up the wrapper script
    install -d "${pkgdir}"/usr/bin
    echo -e '#!/bin/bash\n\nexec /usr/bin/electron /usr/share/proton-pass/app.asar "$@"' \
        | tee "${pkgdir}"/usr/bin/${pkgname} > /dev/null
    chmod +x "${pkgdir}"/usr/bin/${pkgname}

    # Copy the desktop file (and associated icon)
    install -Dm644 assets/logo.svg "${pkgdir}"/usr/share/pixmaps/${pkgname}.svg
    install -Dm644 "${srcdir}"/${pkgname}.desktop -t "${pkgdir}"/usr/share/applications
}
