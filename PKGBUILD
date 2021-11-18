# Maintainer: Dominic Giebert <dominic.giebert@gmail.com>
# Contributor: Parker Johansen <johansen.parker@gmail.com>

pkgname=rancher-desktop
pkgdesc='Rancher Desktop is an open-source project to bring Kubernetes and container management to the desktop'
pkgver=0.6.1
pkgrel=3
arch=('x86_64')
license=('Apache')
url='https://rancherdesktop.io/'
makedepends=('npm' 'nodejs' 'git' )
optdepends=('kubectl: Kubernetes control, can be downloaded from settings'
            'nerdctl-bin: Docker-compatible CLI for containerd'
            'helm: for Apps section, only useful if your deploy uses helm or plan to use it')
provides=('rancher-desktop' 'docker' 'helm' 'kim' 'kubectl' 'nerdctl')
depends=('qemu')
source=("${pkgname}-${pkgver}::git+https://github.com/rancher-sandbox/rancher-desktop.git#branch=main")
sha256sums=('SKIP')
conflicts=('rancher-desktop-git')

build() {
  cd "${pkgname}-${pkgver}"
  # Generate icons
  icon="resources/icons/logo-square-512.png"
  for size in 512x512 256x256 128x128 96x96 64x64 48x48 32x32 24x24 16x16; do
      mkdir "share/icons/hicolor/${size}/apps" -p
      convert -resize "${size}" "${icon}" "share/icons/hicolor/${size}/apps/${pkgname}.png"
  done

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

  # Add integration for desktop env
  install -Dm644 packaging/linux/rancher-desktop.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 packaging/linux/rancher-desktop.appdata.xml -t "$pkgdir/usr/share/metainfo"

  # Creating the symlink for better usage
  install -d "$pkgdir"/usr/bin/
  ln -sf /opt/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}

