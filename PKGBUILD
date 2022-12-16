# Maintainer: Dominic Giebert <dominic.giebert@gmail.com>
# Contributor: Parker Johansen <johansen.parker@gmail.com>

pkgname=rancher-desktop
pkgdesc='Rancher Desktop is an open-source project to bring Kubernetes and container management to the desktop'
pkgver=1.7.0
pkgrel=1
arch=('x86_64')
license=('Apache')
url='https://rancherdesktop.io/'
makedepends=('npm' 'nvm' 'nodejs' 'imagemagick' 'go')
provides=('rancher-desktop' 'docker' 'helm' 'kubectl' 'nerdctl' 'limactl')
depends=('qemu')
source=("https://github.com/rancher-sandbox/rancher-desktop/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a7b6c376a05d8d983c8177476e605212d7e4656b0ae117cd7aaa4a9a9d7552ff')

# https://wiki.archlinux.org/title/Node.js_package_guidelines#Using_nvm
_ensure_local_nvm() {
    which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
    _ensure_local_nvm
    nvm install 16.19.0


    cd "${pkgname}-${pkgver}"
    sed -i "s|childProcess.execFileSync('git', \['describe', '--tags'\]).toString().trim()|'v${pkgver}'|g" scripts/build.ts
    # Uncomment if you want to have the tray functionality
    # sed -i "/if (os.platform() === 'linux' \&\& !settings.isFirstRun()) {\$/,+2d" background.ts

}

build() {
   _ensure_local_nvm
  cd "${pkgname}-${pkgver}"
  # Generate icons
    icon="resources/icons/logo-square-512.png"
    for size in 512x512 256x256 128x128 96x96 64x64 48x48 32x32 24x24 16x16; do
        mkdir "share/icons/hicolor/${size}/apps" -p
        convert -resize "${size}" "${icon}" "share/icons/hicolor/${size}/apps/${pkgname}.png"
    done

  sed -i "s|Exec=rancher-desktop|Exec=opt/${pkgname}/rancher-desktop|g" packaging/linux/rancher-desktop.desktop
  sed -i "s|target: \[ zip \]|target: [ dir ]|g" electron-builder.yml

  # Remove Flatpak and appimage as they are not needed
  rm packaging/linux/appimage.yml
  rm packaging/linux/flatpak.yaml
  # https://github.com/rancher-sandbox/rancher-desktop#how-to-run
  npm install
  npm run build
}

package() {
  cd "${pkgname%-bin}-$pkgver"

  # Copy over the data
  install -d "$pkgdir/opt/${pkgname}"
  install -d "$pkgdir/usr/share/icons/hicolor/"
  cp -r dist/linux-unpacked/* "$pkgdir/opt/${pkgname}/"
  cp -r share/icons/hicolor/* "$pkgdir/usr/share/icons/hicolor/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # Some weird fix
  sed -i "s|opt/rancher-desktop/||g" packaging/linux/rancher-desktop.desktop
  # Add integration for desktop env
  install -Dm644 packaging/linux/rancher-desktop.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 packaging/linux/rancher-desktop.appdata.xml -t "$pkgdir/usr/share/metainfo"

  # Creating the symlink for better usage
  install -d "$pkgdir"/usr/bin/
  ln -sf /opt/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
