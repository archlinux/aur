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
_cb_ver=4.10.3
_cb_build=33770460
_cb_hash=427f3937
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
    'curl' 'python' 'nodejs' 'npm'
    'gcc' 'make' 'pkgconf' 'imagemagick' 'binutils'
)

# Conflict with old package names
conflicts=('codebuddy-cn-ide' 'codebuddycn-ide')
options=('!strip' '!debug')

# Helper repository pinned to a specific commit so the conversion
# logic is reproducible. Bump together with pkgver if needed.
_helper_commit='d8d41ad2884234c81a22247b9375ae61394501e0'

source=(
    "codebuddy-cn_${pkgver}_amd64.deb::https://download.codebuddy.cn/aiide/linux-x64/CodeBuddy-linux-x64-${pkgver}-${_cb_hash}-cn.deb"
    "codebuddy-ide-cn-linux-${_helper_commit}.tar.gz::${url}/archive/${_helper_commit}.tar.gz"
    'LICENSE.notice'
)

# Leave the deb as-is and let install.sh consume it from the srcdir
noextract=(
    "codebuddy-cn_${pkgver}_amd64.deb"
)

sha256sums=('39d3dac13fa4c3d42ea4d77ce2edfd15c20eb8abc4f819ebb009f984e2fae85f'
            '844a7be205c1541f34ed7b1bcc24cb9f3cb884ea1e462e39a0e8e0d8bd7ffe4a'
            'b3260549a765c478dc33680c7b9a1a30e5a038456e340d6d25f7748390724241')

prepare() {
    local helper_dir="${srcdir}/codebuddy-ide-cn-linux-${_helper_commit}"

    [ -f "${helper_dir}/install.sh" ] || {
        echo "ERROR: helper repo not extracted at ${helper_dir}" >&2
        return 1
    }
}

build() {
    local helper_dir="${srcdir}/codebuddy-ide-cn-linux-${_helper_commit}"
    local deb_path="${srcdir}/codebuddy-cn_${pkgver}_amd64.deb"
    local out_dir="${srcdir}/build/${pkgname}"

    install -d "${out_dir}"

    # Drive the upstream automated installer.  Passing CODEBUDDY_APP_ID
    # makes its generated start.sh export the matching CHROME_DESKTOP
    # value at runtime, so window managers attach the right .desktop.
    CODEBUDDY_INSTALL_DIR="${out_dir}" \
    CODEBUDDY_APP_ID="${pkgname}" \
    CODEBUDDY_APP_DISPLAY_NAME='CodeBuddy CN' \
        bash "${helper_dir}/install.sh" --fresh "${deb_path}"

    # Discard build-time desktop file
    rm -f "${out_dir}/.codebuddycn-linux/${pkgname}.desktop"
}

package() {
    local helper_dir="${srcdir}/codebuddy-ide-cn-linux-${_helper_commit}"
    local out_dir="${srcdir}/build/${pkgname}"

    # 1) App payload under /opt/$pkgname.
    install -d "${pkgdir}/opt/${pkgname}"
    cp -a "${out_dir}/." "${pkgdir}/opt/${pkgname}/"

    # Strip gyp/autotools build relics
    find "${pkgdir}/opt/${pkgname}/resources/app/node_modules" \
        \( -name 'obj.target' -o -name 'obj' -o -name '.deps' \) \
        -type d -prune -exec rm -rf {} + 2>/dev/null || true

    rm -f "${pkgdir}/opt/${pkgname}/resources/app/node_modules/@vscode/sqlite3/build/node-addon-api/nothing.a" \
          "${pkgdir}/opt/${pkgname}/resources/app/node_modules/@vscode/sqlite3/build/Release/nothing.a" \
          "${pkgdir}/opt/${pkgname}/resources/app/node_modules/@vscode/sqlite3/build/Release/node-addon-api/nothing.o" \
          2>/dev/null || true

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

    # 4) Icon
    if [ -f "${out_dir}/.codebuddycn-linux/codebuddycn.png" ]; then
        install -Dm644 "${out_dir}/.codebuddycn-linux/codebuddycn.png" \
            "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
    fi

    # 5) Licenses.
    install -Dm644 "${srcdir}/LICENSE.notice" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.notice"

    if [ -f "${helper_dir}/LICENSE" ]; then
        install -Dm644 "${helper_dir}/LICENSE" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.helper-MIT"
    fi

    # Copy upstream licenses
    local upstream_license
    while IFS= read -r upstream_license; do
        install -Dm644 "${out_dir}/${upstream_license}" \
            "${pkgdir}/usr/share/licenses/${pkgname}/upstream/${upstream_license}"
    done < <(find "${out_dir}" -maxdepth 1 \
        \( -name 'LICENSE*' -o -name 'EULA*' -o -name 'NOTICE*' \) \
        -type f -exec basename {} \;)
}
