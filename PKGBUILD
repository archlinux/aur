# Arch
#
# mantainer: Muflone http://www.muflone.com/contacts/english/
# contributor: Piero Proietti <piero.proietti_at_gmail.com>

_commit=d239c9a7f8c57d0aeecbeaa0693b6f1777f20f6f
pkgname=penguins-eggs
pkgver=10.0.55
pkgrel=1
pkgdesc="A console tool that allows you to remaster your system and redistribute it as live images on USB sticks or via PXE"
arch=('any')
url="https://penguins-eggs.net"
license=('GPL2')
depends=(
 'arch-install-scripts'
 'dosfstools'
 'efibootmgr'
 'erofs-utils'
 'findutils'
 'git'
 'grub'
 'jq'
 'libarchive'
 'libisoburn'
 'lsb-release' 
 'lvm2'
 'mkinitcpio-archiso'
 'mkinitcpio-nfs-utils'
 'mtools'
 'nbd'
 'nodejs'
 'pacman-contrib'
 'parted'
 'procps-ng'
 'pv'
 'python'
 'rsync'
 'squashfs-tools'
 'sshfs'
 'wget'
 'xdg-utils' 
)
optdepends=(
 'bash-completion: eggs autocomplete'
 'calamares: system installer GUI'
 'zsh-completions: eggs autocomplete'
)
makedepends=(
 'pnpm'
)

options=('!strip')
source=("git+https://github.com/pieroproietti/penguins-eggs.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
 cd "$srcdir"/"$pkgname"
 node -pe "require('./package.json').version"
}

build() {
 cd "$srcdir"/"$pkgname"
 pnpm install
 pnpm build  
}

package() {
 cd "$srcdir"/"$pkgname"

 install -Dm644 .oclif.manifest.json package.json -t "$pkgdir/"usr/lib/"$pkgname"
 cp -r addons \
  assets \
  bin \
  conf \
  ipxe \
  dracut \
  dist \
  eui \
  mkinitcpio \
  mkinitfs \
  node_modules \
  scripts \
  syslinux \
  "$pkgdir/"usr/lib/"$pkgname/"

 # Fix permissions
 chown root:root "$pkgdir/"usr/lib/"$pkgname/"

 # Install documentation
 install -Dm644 README.md -t "$pkgdir/"usr/share/doc/"$pkgname/"

 # Install bash-completion files
 install -d "$pkgdir/"usr/share/bash-completion/completions
 ln -s /usr/lib/"$pkgname/"scripts/eggs.bash \
  "$pkgdir/"usr/share/bash-completion/completions/

 # Install zsh-completion files
 install -d "$pkgdir/"usr/share/zsh/functions/Completion/Zsh/
 ln -s /usr/lib/"$pkgname/"scripts/_eggs \
  "$pkgdir/"usr/share/zsh/functions/Completion/Zsh/

 # Install man page
 install -Dm644 manpages/doc/man/eggs.1.gz -t "$pkgdir/"usr/share/man/man1/

 # Install desktop file
 install -Dm644 assets/"$pkgname".desktop -t "$pkgdir/"usr/share/applications/

 # Install icon
 install -Dm644 assets/eggs.png -t "$pkgdir/"usr/share/pixmaps/

 # revitalize mom
 chmod +x "$pkgdir/"usr/lib/"$pkgname/"scripts/mom.sh

 # revitalize eui
 chmod +x "$pkgdir"/usr/lib/"$pkgname/"eui/eui-create-image.sh
 chmod +x "$pkgdir"/usr/lib/"$pkgname/"eui/eui-start.sh
 chmod 0400 "$pkgdir"/usr/lib/"$pkgname/"eui/eui-users

 # Symlink executable
 install -d "$pkgdir/"usr/bin
 ln -s /usr/lib/"$pkgname"/bin/run.js "$pkgdir"/usr/bin/eggs

 # Symlink to adapt
 ln -s /usr/lib/"$pkgname/"addons/eggs/adapt/bin/adapt "$pkgdir/"usr/bin/adapt
}
