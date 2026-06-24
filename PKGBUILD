# Maintainer: Zeongit J. <https://github.com/JipZeonGit/codebuddy-ide-cn-linux/issues>
#
# This PKGBUILD is licensed under the MIT License.
# It contains no proprietary code; it only orchestrates the download,
# extraction, and packaging of upstream binaries that the end user
# fetches directly from Tencent's official CDN at install time.
#
# The packaged software (Tencent CodeBuddy IDE) remains subject to
# Tencent's proprietary CodeBuddy service license, NOT this MIT notice.

pkgname=codebuddy-ide-cn
_cb_ver=4.9.14
_cb_build=31414011
_cb_hash=6230de8a
pkgver="${_cb_ver}.${_cb_build}"
pkgrel=1
pkgdesc='腾讯云代码助手CodeBuddy IDE，是一款辅助编码工具。'
arch=('x86_64')
url='https://github.com/JipZeonGit/codebuddy-ide-cn-linux'
license=('LicenseRef-Tencent-CodeBuddy')

depends=(
    'gtk3' 'nss' 'libxss' 'alsa-lib' 'libsecret' 'libxkbfile'
    'libnotify' 'libcups'
)

# These are referenced only by optional bundled extensions / utility
# scripts; the main IDE process uses the bundled Electron's node.
optdepends=(
    'python: required by the genie skill-creator extension scripts'
    'nodejs: required only when invoking bundled CLI helpers in node_modules'
)

makedepends=(
    '7zip' 'curl' 'unzip' 'python' 'nodejs' 'npm'
    'gcc' 'make' 'pkgconf' 'libicns' 'imagemagick'
)

# Conflict with old package names
conflicts=('codebuddy-cn-ide' 'codebuddycn-ide')

# - !strip:  Electron native binaries break under strip.
# - !debug:  prevent a -debug split package when global makepkg.conf
#            has debug enabled (CachyOS turns it on by default).
options=('!strip' '!debug')

# Helper repository pinned to a specific commit so the conversion
# logic is reproducible. Bump together with pkgver if needed.
_helper_commit='3d5a015100ef22e8f8308cd7d5dc5c19faf6b097'
_electron_version=35.6.0

source=(
    "CodeBuddy-darwin-x64-${pkgver}-${_cb_hash}-cn.dmg::https://download.codebuddy.cn/aiide/darwin-x64/CodeBuddy-darwin-x64-${pkgver}-${_cb_hash}-cn.dmg"
    "codebuddy-ide-cn-linux-${_helper_commit}.tar.gz::${url}/archive/${_helper_commit}.tar.gz"
    "electron-v${_electron_version}-linux-x64.zip::https://github.com/electron/electron/releases/download/v${_electron_version}/electron-v${_electron_version}-linux-x64.zip"
    'LICENSE.notice'
)

# DMG is not a format makepkg can extract; leave the Electron zip as-is
# and let install.sh consume it from a pre-populated cache directory.
noextract=(
    "CodeBuddy-darwin-x64-${pkgver}-${_cb_hash}-cn.dmg"
    "electron-v${_electron_version}-linux-x64.zip"
)

sha256sums=('83a7101717fc6eb327a381140a23bd756d511ffbb2c511109caba6fa47f9fcc9'
            'a602fdef69a33f01e8f4264dfdaf33134383de103a666eac51b19ce4cc2133e8'
            '94f3987a46b7cc39f16dc3428e304dd0dee679f3266fbea85ccfeb3daabb2c45'
            'b3260549a765c478dc33680c7b9a1a30e5a038456e340d6d25f7748390724241')

prepare() {
    local helper_dir="${srcdir}/codebuddy-ide-cn-linux-${_helper_commit}"

    # GitHub archive tarballs do not preserve the executable bit, so
    # check for existence rather than -x.
    [ -f "${helper_dir}/install.sh" ] || {
        echo "ERROR: helper repo not extracted at ${helper_dir}" >&2
        return 1
    }

    # Feed install.sh a pre-populated Electron cache so it skips the
    # network download step inside build().
    install -d "${srcdir}/electron-cache"
    cp -a "${srcdir}/electron-v${_electron_version}-linux-x64.zip" \
          "${srcdir}/electron-cache/"
}

build() {
    local helper_dir="${srcdir}/codebuddy-ide-cn-linux-${_helper_commit}"
    local dmg_path="${srcdir}/CodeBuddy-darwin-x64-${pkgver}-${_cb_hash}-cn.dmg"
    local out_dir="${srcdir}/build/${pkgname}"

    install -d "${out_dir}"

    # Drive the upstream automated installer.  Passing CODEBUDDY_APP_ID
    # makes its generated start.sh export the matching CHROME_DESKTOP
    # value at runtime, so window managers attach the right .desktop.
    CODEBUDDY_INSTALL_DIR="${out_dir}" \
    CODEBUDDY_APP_ID="${pkgname}" \
    CODEBUDDY_APP_DISPLAY_NAME='CodeBuddy CN' \
    CODEBUDDY_ELECTRON_CACHE_DIR="${srcdir}/electron-cache" \
    ELECTRON_VERSION="${_electron_version}" \
        bash "${helper_dir}/install.sh" --fresh "${dmg_path}"

    # The desktop entry written by install.sh embeds absolute build-time
    # paths from ${out_dir}.  We ship a clean system-wide entry from
    # package(); discard the build-time copy so it never lands in /opt.
    rm -f "${out_dir}/.codebuddycn-linux/${pkgname}.desktop"
}

package() {
    local helper_dir="${srcdir}/codebuddy-ide-cn-linux-${_helper_commit}"
    local out_dir="${srcdir}/build/${pkgname}"

    # 1) App payload under /opt/$pkgname.
    install -d "${pkgdir}/opt/${pkgname}"
    cp -a "${out_dir}/." "${pkgdir}/opt/${pkgname}/"

    # 1b) Strip gyp / autotools intermediate build artifacts that the
    # rebuilt native modules leave behind.  Only the final *.node files
    # in build/Release/ are needed at runtime.  Removing these:
    #   - drops ~50 MB of debug junk from the package
    #   - eliminates many namcap warnings (unstripped .o files, missing
    #     PIE/RELRO on intermediate objects)
    #   - resolves cross-directory hardlink errors (gyp writes the
    #     same .node twice and hardlinks them)
    find "${pkgdir}/opt/${pkgname}/resources/app/node_modules" \
        \( -name 'obj.target' -o -name 'obj' -o -name '.deps' \) \
        -type d -prune -exec rm -rf {} + 2>/dev/null || true

    # sqlite3 leaves an unused placeholder static archive that namcap
    # flags as a cross-directory hardlink. Drop it; nothing links it.
    rm -f "${pkgdir}/opt/${pkgname}/resources/app/node_modules/@vscode/sqlite3/build/node-addon-api/nothing.a" \
          "${pkgdir}/opt/${pkgname}/resources/app/node_modules/@vscode/sqlite3/build/Release/nothing.a" \
          "${pkgdir}/opt/${pkgname}/resources/app/node_modules/@vscode/sqlite3/build/Release/node-addon-api/nothing.o" \
          2>/dev/null || true

    # Clean up empty directories left by the prune above and by the
    # earlier removal of macOS/Windows-only platform modules.
    find "${pkgdir}/opt/${pkgname}/resources/app/node_modules" \
        -type d -empty -delete 2>/dev/null || true

    # 2) /usr/bin launcher.
    install -d "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" <<EOF
#!/bin/bash
exec /opt/${pkgname}/start.sh "\$@"
EOF
    chmod 0755 "${pkgdir}/usr/bin/${pkgname}"

    # 3) System desktop entry.
    install -d "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Name=CodeBuddy CN
Comment=${pkgdesc}
Exec=/usr/bin/${pkgname} %F
Icon=${pkgname}
Type=Application
Categories=Development;IDE;
StartupNotify=true
StartupWMClass=CodeBuddy CN
MimeType=x-scheme-handler/codebuddycn;
EOF
    chmod 0644 "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # 4) Icon, by hicolor theme name '${pkgname}'.
    if [ -f "${out_dir}/.codebuddycn-linux/codebuddycn.png" ]; then
        install -Dm644 "${out_dir}/.codebuddycn-linux/codebuddycn.png" \
            "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
    fi

    # 5) Licenses.  /usr/share/licenses/$pkgname/ must exist because
    # license=('custom').  We ship:
    #   - LICENSE.notice       : explanation of the layered licensing
    #   - LICENSE.helper-MIT   : MIT text covering the recipe + scripts
    #   - upstream/*           : any LICENSE/EULA/NOTICE found in .app
    install -Dm644 "${srcdir}/LICENSE.notice" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.notice"

    if [ -f "${helper_dir}/LICENSE" ]; then
        install -Dm644 "${helper_dir}/LICENSE" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.helper-MIT"
    fi

    # Only the official upstream LICENSE/EULA/NOTICE files at the root of
    # the app payload are relevant.  Going deeper would scoop up MIT/BSD
    # notices from third-party node_modules, which are NOT the license
    # the user is agreeing to when they install this package.
    local upstream_license
    while IFS= read -r upstream_license; do
        [ -f "${upstream_license}" ] || continue
        install -Dm644 "${upstream_license}" \
            "${pkgdir}/usr/share/licenses/${pkgname}/upstream/\$(basename "${upstream_license}")"
    done < <(find "${out_dir}/resources/app" \
                -maxdepth 1 \
                \( -iname 'LICENSE*' -o -iname 'EULA*' -o -iname 'NOTICE*' \
                   -o -iname 'ThirdPartyNotices*' \) \
                -type f 2>/dev/null || true)
}
