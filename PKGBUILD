# Maintainer: Julius Rüberg <julius.rueberg@protonmail.ch>

pkgname=gnome-ssh-askpass4-git
_pkgbase=openssh-portable
_file=contrib/gnome-ssh-askpass4.c
pkgver=20250714.e6805e2a6
pkgrel=1
pkgdesc='A passphrase requester for ssh-add using gcr.'
arch=('x86_64')
url="https://www.openssh.com/portable.html"
license=('custom:2-term BSD licence')
depends=('gcr-4')
makedepends=('git')
provides=('x11-ssh-askpass')
conflicts=('gnome-ssh-askpass' 'gnome-ssh-askpass2' 'gnome-ssh-askpass3')

source=(
    "git+https://github.com/openssh/${_pkgbase}.git"
    gnome-ssh-askpass4.sh
    gnome-ssh-askpass4.conf
)
sha256sums=(
    'SKIP'
    '89309c0cc5c58bba32d03c1d998175f01b1f471589b4400dfe5d01702837c828'
    'b764444c2a1441cf401f143fd3dcf9c6588a59013b1c5dabfa8a5bfad30f667a'
)

pkgver() {
  cd "${srcdir}/${_pkgbase}"
  printf '%s.%s' \
    "$(git log -1 --format=%cd --date=format:%Y%m%d -- "$_file")" \
    "$(git log -1 --format=%h -- "$_file")"
}

build() {
  cd "${srcdir}/${_pkgbase}/contrib"
  make gnome-ssh-askpass4
}

package() {
  cd "${srcdir}/${_pkgbase}/contrib"

  install -D -m 755 gnome-ssh-askpass4 "${pkgdir}/usr/lib/ssh/gnome-ssh-askpass4"
  install -D -m 755 "${srcdir}/gnome-ssh-askpass4.sh" "${pkgdir}/etc/profile.d/gnome-ssh-askpass4.sh"
  install -D -m 644 ../LICENCE -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  for _unit in ssh-agent gcr-ssh-agent
  do
      install -D -m 644 "${srcdir}/gnome-ssh-askpass4.conf" \
          "${pkgdir}/usr/lib/systemd/user/${_unit}.service.d/gnome-ssh-askpass4.conf"
  done
}
