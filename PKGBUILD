# Maintainer: Piero Proietti <piero.proietti_at_gmail.com>
# Contributor: Stefano Capitani <stefano_at_manjaro_org>
# Contributor: Muflone http://www.muflone.com/contacts/english/
# Contributor: osiixy <osiixy at gmail dot com>

pkgname=penguins-eggs
pkgver=9.4.3
pkgrel=1
pkgdesc="A console tool, under continuous development, that allows you to remaster your system and redistribute it as live images on usb sticks or via PXE"
arch=('any')
url='https://penguins-eggs.net'
license=('GPL2')
depends=('arch-install-scripts' 'dosfstools' 'erofs-utils' 'findutils' 'grub' 
         'jq' 'libarchive' 'libisoburn' 'lsb-release' 'lvm2' 'mkinitcpio-archiso'
  'mkinitcpio-nfs-utils' 'mtools' 'nbd' 'nodejs' 'npm' 'pacman-contrib' 'parted' 
  'procps-ng' 'pv' 'python' 'rsync' 'squashfs-tools' 'sshfs' 'syslinux' 
  'xdg-utils')
optdepends=(
  'bash-completion: eggs autocomplete' 
  'zsh-autosuggestions: eggs autocomplete' 
  'calamares: system installer GUI' 
)
makedepends=('git')
options=('!strip')
_commit=d42e7f82fc620f1031165510184f293ffc93c2e8  # v9.4.3
source=("git+https://github.com/pieroproietti/penguins-eggs.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  grep 'version' package.json | awk 'NR==1 {print $2 }' | awk -F '"' '{print $2}'
}

build() {
  cd "${srcdir}/${pkgname}"

  # Install pnpm into "pnpm-dir"
  npm set prefix "pnpm-dir"
  npm install -g pnpm
  # Build lib
  pnpm-dir/bin/pnpm install
  pnpm-dir/bin/pnpm build
}

package() {
  cd "${srcdir}/${pkgname}"

  # Fix permissions
  chown root:root "dist" "node_modules"

  # We need them on /usr/lib/
  # Fix paths for node modules
  find node_modules -type f -print0 | xargs --null sed -i "s#${srcdir}/${pkgname}-${pkgver}/#/usr/lib/eggs/#"

  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}"
  cp -r -t "${pkgdir}/usr/lib/${pkgname}/" addons assets bin conf dist ipxe node_modules mkinitcpio pnpm-lock.yaml scripts .oclif.manifest.json
  install -m 644 -D package.json -t "${pkgdir}/usr/lib/${pkgname}/"

  # Install documentation
  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}/"
  install -m 644 -D README.md "${pkgdir}/usr/share/doc/${pkgname}/"

  # Symlink executable
  install -m 755 -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/bin/run" "${pkgdir}/usr/bin/eggs"

  # Install bash-completion
  install -m 755 -d "${pkgdir}/usr/share/bash-completion/completions"
  mv "${pkgdir}/usr/lib/${pkgname}/scripts/eggs.bash" "${pkgdir}/usr/share/bash-completion/completions/"

  # Install zsh autocompletion
  install -m 755 -d "${pkgdir}/usr/share/zsh/functions/Completion/Zsh/"
  mv "${pkgdir}/usr/lib/${pkgname}/scripts/_eggs" "${pkgdir}/usr/share/zsh/functions/Completion/Zsh/"

  # Install man page
  install -m 644 -D manpages/doc/man/eggs.1.gz "${pkgdir}/usr/share/man/man1/eggs.1.gz"

  # Install desktop files
  install -m 644 -D "assets/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install icons
  install -m 644 -D assets/eggs.png -t "${pkgdir}/usr/share/pixmaps/"
}
