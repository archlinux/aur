# Maintainer: dsandall <dsandalledu@gmail.com>
pkgname=screenconnect-bin
_pkgname=connectwisecontrol-3093ce05059ac871
pkgver=25.9.5.9473
pkgrel=1
pkgdesc='ConnectWise ScreenConnect remote desktop client'
arch=('x86_64')
url='https://screenconnect.com'
license=('custom')
depends=('java-runtime' 'xdg-utils')
source=()
sha256sums=()
install=screenconnect-bin.install
options=('!strip')
backup=("opt/${_pkgname}/ClientLaunchParameters.txt")

_first_line_of() {
    grep -anF -m 1 "$1" "$2" | grep -o '^[[:digit:]]*'
}

prepare() {
    local _file="$startdir/ScreenConnect.ClientSetup.sh"
    [[ -f "$_file" ]] || { echo "ERROR: Place ScreenConnect.ClientSetup.sh (downloaded from your SC instance) alongside the PKGBUILD before running makepkg."; return 1; }
    cp "$_file" "$srcdir/ScreenConnect.ClientSetup.sh"
    local _file="$srcdir/ScreenConnect.ClientSetup.sh"

    # Extract tar.gz payload from self-extracting script
    local _start=$(($(_first_line_of 'tar.gz__commencement' "$_file") + 1))
    local _end=$(_first_line_of 'tar.gz__completion' "$_file")
    local _lines=$((_end - _start))
    tail -n+"$_start" "$_file" | head -n"$_lines" > "$srcdir/${_pkgname}.tar.gz"
    perl -i -0pe 's/\n\Z//' "$srcdir/${_pkgname}.tar.gz"

    tar xzf "$srcdir/${_pkgname}.tar.gz" -C "$srcdir"
}

package() {
    local _installdir="/opt/${_pkgname}"

    # Install application files
    install -dm755 "$pkgdir/$_installdir"

    cd "$srcdir/${_pkgname}"

    install -Dm644 -t "$pkgdir/$_installdir" \
        ScreenConnect.Client.jar \
        ScreenConnect.Core.jar \
        libscnative_libwebp_x64.so \
        libscnative_libwebp_x86.so \
        libscnative_libzstd_x64.so \
        libscnative_libzstd_x86.so \
        ApplicationIcon32.png \
        ClientLaunchParameters.txt

    install -Dm755 -t "$pkgdir/$_installdir" \
        libscnative_x64.so \
        libscnative_x86.so

    install -Dm600 .Xauthority "$pkgdir/$_installdir/.Xauthority"

    # Create launcher script adapted for system-level /opt installation
    {
        echo '#!/bin/sh'
        echo '# HiDPI: detect Wayland scale so Java renders at native res under XWayland'
        echo 'if command -v hyprctl >/dev/null 2>&1; then'
        echo '    _scale=$(hyprctl monitors -j 2>/dev/null | sed -n '\''s/.*"scale": *\([0-9.]*\).*/\1/p'\'' | head -1)'
        echo '    [ -n "$_scale" ] && export _JAVA_OPTIONS="-Dsun.java2d.uiScale=$_scale"'
        echo 'fi'
        echo 'export _JAVA_AWT_WM_NONREPARENTING=1'
        # Append the rest of ClientLauncher.sh (minus the shebang), with path fixes
        tail -n+2 ClientLauncher.sh
    } | sed -e "s|^userLevelApplicationsDirectory=.*|clientInstallationDirectory='$_installdir'|" \
            -e '/\$userLevelApplicationsDirectory/d' \
            -e '/^logFilePath=/d' \
            -e 's|^\$launchCommandLine.*|exec \$launchCommandLine|' \
        > "$pkgdir/$_installdir/run.sh"
    chmod 755 "$pkgdir/$_installdir/run.sh"

    # Write ClientLaunchParameters.txt with connection parameters from installer
    local _params
    _params=$(grep -a "^newClientLaunchParameters=" "$srcdir/ScreenConnect.ClientSetup.sh" | head -1 | cut -d"'" -f2)
    echo "$_params" > "$pkgdir/$_installdir/ClientLaunchParameters.txt"

    # Install .desktop file for URI scheme handler (browser "Connect" button)
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/${_pkgname}.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=ScreenConnect Client
Exec=$_installdir/run.sh %u
Icon=$_installdir/ApplicationIcon32.png
MimeType=x-scheme-handler/sc-3093ce05059ac871;
NoDisplay=true
EOF

    # Install systemd service
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/system/${_pkgname}.service" <<EOF
[Unit]
Description=ConnectWise ScreenConnect Client
After=network.target

[Service]
Type=simple
ExecStart=$_installdir/run.sh
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF
}
