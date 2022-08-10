# Maintainer: Piero Proietti <piero.proietti_at_gmail.com>
# Contributor: Stefano Capitani <stefano_at_manjaro_org>
# Contributor: Muflone http://www.muflone.com/contacts/english/
# Contributor: osiixy <osiixy at gmail dot com>

pkgname=penguins-eggs
pkgver=9.2.1
pkgrel=1
pkgdesc="A terminal utility which allows you to remaster your system and redistribute it as an ISO image, on a USB stick or through the network via PXE remote boot"
arch=('any')
url='https://penguins-eggs.net'
license=('GPL2')
options=('!strip')
makedepends=('npm')
depends=('arch-install-scripts' 'dosfstools' 'erofs-utils' 'findutils' 'grub'
         'libarchive' 'libisoburn' 'lsb-release' 'lvm2' 'mtools'
         'mkinitcpio-archiso' 'mkinitcpio-nfs-utils' 'nbd' 'nodejs'
         'pacman-contrib' 'parted' 'python' 'procps-ng' 'pv' 'rsync' 'syslinux'
         'squashfs-tools' 'xdg-utils')
optdepends=('bash-completion: enable eggs commands automatic completion'
            'calamares: system installer GUI')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/pieroproietti/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('264761bf66154e5bf6f96364d64a4d81fce4839f61e80a901160cc46f517cb0c')

build() {
  cd "${pkgname}-${pkgver}"
  # Install pnpm into "pnpm-dir"
  npm set prefix "pnpm-dir"
  npm install -g pnpm
  # Build lib
  pnpm-dir/bin/pnpm install
  pnpm-dir/bin/pnpm run build
}

package() {
  cd "${pkgname}-${pkgver}"

  # Fix permissions
  chown root:root "lib" "node_modules"
  # Fix paths for node modules
  find node_modules -type f -print0 | xargs --null sed -i "s#${srcdir}/${pkgname}-${pkgver}/#/usr/lib/eggs/#"

  # We need them on /usr/lib/ not in /opt
  # I don't see problems. To change in /opt it's 
  # will be possible too, but need changes of sources
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}"
  cp -r -t "${pkgdir}/usr/lib/${pkgname}/" addons assets bin conf lib node_modules mkinitcpio pnpm-lock.yaml scripts
  install -m 644 -D package.json -t "${pkgdir}/usr/lib/${pkgname}/"
  # Install documentation
  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}/"
  install -m 644 -D README.md "${pkgdir}/usr/share/doc/${pkgname}/"

  # Symlink executable
  install -m 755 -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/bin/run" "${pkgdir}/usr/bin/eggs"

  # Install shell completion files
  install -m 755 -d "${pkgdir}/usr/share/bash-completion/completions"
  mv "${pkgdir}/usr/lib/${pkgname}/scripts/eggs.bash" "${pkgdir}/usr/share/bash-completion/completions/"
  install -m 755 -d "${pkgdir}/usr/share/zsh/functions/Completion/Zsh/"
  mv "${pkgdir}/usr/lib/${pkgname}/scripts/_eggs" "${pkgdir}/usr/share/zsh/functions/Completion/Zsh/"

  # Install man page
  install -m 644 -D manpages/doc/man/eggs.roll.gz "${pkgdir}/usr/share/man/man1/eggs.1.gz"

  # Install desktop files
  install -m 644 -D "assets/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install icons
  install -m 644 -D assets/eggs.png -t "${pkgdir}/usr/share/pixmaps/"
}

