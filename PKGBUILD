# Maintainer: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>

_pkgname=st-dist
pkgname=subversive-takedown
pkgver=41
pkgrel=1
pkgdesc='A top-down, tactical voxel shooter, inspired by games like SND Online, Voxatron/Ace of Spades and Wolfenstein: Enemy Territory'
url='http://mp2.dk/st/'
license=('custom:ClosedSource')
source_i686=('http://mp2.dk/st/builds/linux-i686/st-07612501882b2f1249fc2601074cb70da07fffe4-linux-i686.tar.gz')
sha256sums_i686=('bc9f7b56676d0ae23bd7d63b135e42bb5ca1f8ab60c3b37754dec9d3c321c15f')
source_x86_64=('http://mp2.dk/st/builds/linux-x86_64/st-07612501882b2f1249fc2601074cb70da07fffe4-linux-x86_64.tar.gz')
sha256sums_x86_64=('bc9f7b56676d0ae23bd7d63b135e42bb5ca1f8ab60c3b37754dec9d3c321c15f')
arch=('i686' 'x86_64')
depends=('enet' 'libvorbis' 'openal' 'python2' 'zenity')
backup=('opt/subversive-takedown/config.txt')

prepare() {
  cd "${srcdir}/${_pkgname}"

  # Patch Python scripts to use Python 2.
  for pythonscript in $(find -name '*.py'); do
    sed -i 's/python/python2/' "${pythonscript}"
  done
}

package() {
  cd "${srcdir}/${_pkgname}"

  # Prepare the directory structure.
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/etc/subversive-takedown"
  install -dm755 "${pkgdir}/opt"

  # Copy the directory tree over.
  cp -r . "${pkgdir}/opt/subversive-takedown"

  # Install the program.
  ln -s /opt/subversive-takedown/run_client.sh \
        "${pkgdir}/usr/bin/subversive-takedown"
  ln -s /opt/subversive-takedown/run_server.sh \
        "${pkgdir}/usr/bin/subversive-takedown-server"
  # Install the configs.
  ln -s /opt/subversive-takedown/config.txt \
        "${pkgdir}/etc/subversive-takedown/config.txt"
  ln -s /opt/subversive-takedown/config.txt.pacnew \
        "${pkgdir}/etc/subversive-takedown/config.txt.pacnew"

  # Remove useless bundled libraries.
  rm -rf "${pkgdir}/opt/subversive-takedown/lib"
}

# vim: ft=sh ts=2 sw=2 et
