# Arch
#
# Mantainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Piero Proietti <piero.proietti_at_gmail.com>

_commit=8e3e7ca911dcbc3db3cb80772bab97b47cb76e7a  # v9.4.6

pkgname=penguins-eggs
pkgver=9.4.6
pkgrel=1
pkgdesc="A console tool that allows you to remaster your system and redistribute it as live images on USB sticks or via PXE"
arch=('any')
url="https://penguins-eggs.net"
license=('GPL2')
depends=('arch-install-scripts' 'dosfstools' 'erofs-utils' 'findutils' 'grub' 
         'jq' 'libarchive' 'libisoburn' 'lsb-release' 'lvm2' 'mkinitcpio-archiso'
         'mkinitcpio-nfs-utils' 'mtools' 'nbd' 'nodejs' 'pacman-contrib' 'parted' 
         'procps-ng' 'pv' 'python' 'rsync' 'squashfs-tools' 'sshfs' 'syslinux' 'xdg-utils')
optdepends=('bash-completion: eggs autocomplete'
            'zsh-completions: eggs autocomplete'
            'calamares: system installer GUI')
makedepends=('git' 'npm')
options=('!strip')
source=("git+https://github.com/pieroproietti/penguins-eggs.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  grep 'version' package.json | awk 'NR==1 {print $2 }' | awk -F '"' '{print $2}'
}

build() {
  cd "${srcdir}/${pkgname}"
  pnpm config set cache-dir "$srcdir/pnpm-cache"
  pnpm i
  pnpm build
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm644 .oclif.manifest.json package.json -t "${pkgdir}/usr/lib/${pkgname}/"
  cp -r addons assets bin conf ipxe dist mkinitcpio node_modules scripts \
    "${pkgdir}/usr/lib/${pkgname}/"

  # Fix permissions
  chown root:root "${pkgdir}/usr/lib/${pkgname}/"{dist,node_modules}

  # Package contains reference to $srcdir
  find "${pkgdir}/usr/lib/${pkgname}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

  local tmppackage="$(mktemp)"
  local pkgjson="${pkgdir}/usr/lib/${pkgname}/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "${pkgjson}" > "${tmppackage}"
  mv "${tmppackage}" "${pkgjson}"
  chmod 644 "${pkgjson}"

  # Fix paths for node modules
  find node_modules -type f -print0 | xargs --null sed -i \
    "s#${srcdir}/${pkgname}-${pkgver}/#/usr/lib/eggs/#"

  # Install documentation
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"

  # Symlink executable
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/bin/run" "${pkgdir}/usr/bin/eggs"

  # Install shell completion files
  install -d "${pkgdir}/usr/share/bash-completion/completions"
  mv "${pkgdir}/usr/lib/${pkgname}/scripts/eggs.bash" \
    "${pkgdir}/usr/share/bash-completion/completions/"
  install -d "${pkgdir}/usr/share/zsh/functions/Completion/Zsh/"
  mv "${pkgdir}/usr/lib/${pkgname}/scripts/_eggs" \
    "${pkgdir}/usr/share/zsh/functions/Completion/Zsh/"

  # Install man page
  install -Dm644 manpages/doc/man/eggs.1.gz -t "${pkgdir}/usr/share/man/man1/"

  # Install desktop file
  install -Dm644 "assets/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"

  # Install icon
  install -Dm644 assets/eggs.png -t "${pkgdir}/usr/share/pixmaps/"
}
