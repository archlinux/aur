# Maintainer: Dominic Giebert <dominic.giebert@gmail.com>

pkgname=rancher-desktop
pkgdesc='Rancher Desktop is an open-source project to bring Kubernetes and container management to the desktop'
pkgver=0.6.1
pkgrel=2
arch=('x86_64')
license=('MIT')
url='https://rancherdesktop.io/'
makedepends=('npm' 'nodejs' 'git' )
optdepends=('kubectl: Kubernetes control, can be downloaded from settings'
            'nerdctl-bin: Docker-compatible CLI for containerd'
            'helm: for Apps section, only useful if your deploy uses helm or plan to use it')
depends=('qemu')
source=("${pkgname}-${pkgver}::git+https://github.com/rancher-sandbox/rancher-desktop.git#branch=main")
sha256sums=('SKIP')

build() {
  cd "${pkgname}-${pkgver}"
  # Generate icons
    icon="resources/icons/logo-square-512.png"
    for size in 512x512 256x256 128x128 96x96 64x64 48x48 32x32 24x24 16x16; do
        mkdir "share/icons/hicolor/${size}/apps" -p
        convert -resize "${size}" "${icon}" "share/icons/hicolor/${size}/apps/${pkgname}.png"
    done

  sed -i "s|Exec=rancher-desktop|Exec=/opt/${pkgname}/rancher-desktop|g" packaging/linux/rancher-desktop.desktop

  # Remove Flatpak and appimage as they are not needed
  rm packaging/linux/appimage.yml
  rm packaging/linux/flatpak.yaml
  # https://github.com/rancher-sandbox/rancher-desktop#how-to-run
  npm install
  npm run build


}

package() {
  cd "${pkgname%-bin}-$pkgver"
  install -d "$pkgdir/opt/${pkgname}"
  install -d "$pkgdir/usr/share/icons/hicolor/"
  install -d "$pkgdir/usr/share/applications/"
  install -d "$pkgdir/usr/share/metainfo"
  cp -r dist/linux-unpacked/* "$pkgdir/opt/${pkgname}/"
  cp -r share/icons/hicolor/* "$pkgdir/usr/share/icons/hicolor/"
  cp -r packaging/linux/rancher-desktop.desktop "$pkgdir/usr/share/applications/rancher-desktop.desktop"
  cp -r packaging/linux/rancher-desktop.appdata.xml "$pkgdir/usr/share/metainfo/rancher-desktop.appdata.xml"
}
