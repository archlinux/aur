# Maintainer: Fatih Bakal fatihbakal7@protonmail.com
pkgname=am
pkgver=placeholder
pkgrel=1
pkgdesc="AppImage package manager to install, update and manage ALL of them, system-wide or locally."
url="https://github.com/ivan-hc/AM"
arch=('any')
license=('GPL3')

depends=(
    'coreutils'
    'curl'
    'grep'
    'less'
    'sed'
    'wget'
    'git'
    'jq'
    'fuse2'
    'fuse3'
)

source=("https://raw.githubusercontent.com/ivan-hc/AM/main/APP-MANAGER")
sha256sums=('SKIP')

package() {
    # Create the main directory for AM
    install -dm755 "$pkgdir/opt/am/modules"
    install -dm755 "$pkgdir/usr/local/bin"

    # Create the uninstall script
    cat << 'EOF' > "$pkgdir/opt/am/remove"
#!/bin/sh
set -e
if [ "$(id -u)" -ne 0 ]; then echo "Permission denied"; exit 1; fi
rm -f /usr/local/bin/am
rm -R -f /opt/am
EOF
    chmod a+x "$pkgdir/opt/am/remove"

    # Move the downloaded main script
    install -Dm755 "${srcdir}/APP-MANAGER" "$pkgdir/opt/am/APP-MANAGER"
    ln -s /opt/am/APP-MANAGER "$pkgdir/usr/local/bin/am"

    # Download all modules from the GitHub repository
    module_base_url="https://raw.githubusercontent.com/ivan-hc/AM/main/modules"
    modules=$(curl -s https://api.github.com/repos/ivan-hc/AM/contents/modules | jq -r '.[].name')

    for module_name in $modules; do
        echo " ◆ Downloading $module_name..."
        curl -L -o "$pkgdir/opt/am/modules/$module_name" "$module_base_url/$module_name"
        chmod a+x "$pkgdir/opt/am/modules/$module_name"
    done

    # Change ownership to the current user
    chown -R "$USER" "$pkgdir/opt/am" 2>/dev/null || true
}
