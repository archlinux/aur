# Maintainer: Your Name <your-email@example.com>
# Contributor: Your Name <your-email@example.com>

# Binary package repackaged from upstream's official .deb release.
# To update: bump _upstream_ver + _upstream_tag, run updpkgsums, then makepkg -si.

pkgname=traycer-desktop-bin
_pkgname=traycer-desktop
_upstream_ver=1.1.8
_upstream_tag=desktop-v${_upstream_ver}
pkgver=${_upstream_ver}
pkgrel=1
pkgdesc="Traycer standalone desktop shell (Electron) hosting the gui-app renderer"
arch=('x86_64')
url='https://traycer.ai'
license=('MIT')
depends=(
  'gtk3'            # libgtk-3-0
  'libnotify'       # libnotify4
  'nss'             # libnss3
  'libxss'          # libxss1
  'libxtst'         # libxtst6
  'xdg-utils'       # xdg-utils
  'at-spi2-core'    # libatspi2.0-0
  'util-linux-libs' # libuuid1
  'libsecret'       # libsecret-1-0
)
optdepends=(
  'libappindicator-gtk3: system tray indicator'   # libappindicator3-1
  'apparmor: AppArmor profile (auto-installed by upstream postinst)'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!strip' '!emptydirs')
install=traycer-desktop.install
source=("$_pkgname-${pkgver}.deb::https://github.com/traycerai/traycer/releases/download/${_upstream_tag}/${_pkgname}-linux-amd64.deb")
sha256sums=('9dc8379ccbe5450b164ce7339ff3985204bd40b63c7f8bde12eb4a43ff9a69de')
noextract=("${_pkgname}-${pkgver}.deb")

# Pin the deb directly; extract data.tar.xz from the .ar wrapper in build().
build() {
    cd "$srcdir"
    # A .deb is an `ar` archive holding control.tar.xz + data.tar.xz.
    ar x "$_pkgname-$pkgver.deb" data.tar.xz
    bsdtar -xf data.tar.xz -C "$srcdir"
}

package() {
    cd "$srcdir"

    # Upstream tree: /opt/Traycer  and  /usr/share/{applications,icons,doc}
    install -d "$pkgdir/opt" "$pkgdir/usr/bin"
    cp -a opt/Traycer "$pkgdir/opt/"

    # /usr/bin/traycer-desktop  (replicates upstream postinst update-alternatives link)
    ln -s /opt/Traycer/$_pkgname "$pkgdir/usr/bin/$_pkgname"

    # .desktop + MIME handler (x-scheme-handler/traycer)
    install -Dm644 "usr/share/applications/$_pkgname.desktop" \
        "$pkgdir/usr/share/applications/$_pkgname.desktop"

    # hicolor icons (icon name already matches StartupWMClass/Icon=traycer-desktop)
    cp -a usr/share/icons "$pkgdir/usr/share/"

    # LICENSE files shipped inside the app bundle — surface them for pacman -Ql compliance
    install -Dm644 opt/Traycer/LICENSE.electron.txt \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"

    # AppArmor profile (Ubuntu 24+ ships one; install it on Arch too if AppArmor is present)
    if [[ -f opt/Traycer/resources/apparmor-profile ]]; then
        install -Dm644 opt/Traycer/resources/apparmor-profile \
            "$pkgdir/etc/apparmor.d/$_pkgname"
    fi

    # chrome-sandbox: upstream postinst sets SUID only when kernel user namespaces
    # are unavailable. Arch kernels ship with unprivileged userns, so 0755 is fine.
    # If you hit sandbox errors, run:  sudo chmod 4755 /opt/Traycer/chrome-sandbox
    chmod 0755 "$pkgdir/opt/Traycer/chrome-sandbox"

    # Drop the Debian changelog stub; not useful on Arch.
    rm -rf "$pkgdir/usr/share/doc"
}
