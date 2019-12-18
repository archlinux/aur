# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=armitage-git
gitname=armitage
pkgver=1248.c8ca6c0
pkgrel=2
pkgdesc="Metasploit GUI Front ened written in java"
url="http://www.fastandeasyhacking.com/"
arch=('any')
license=('GPL')
depends=('metasploit' 'java-environment' 'postgresql')
makedepends=('apache-ant')
conflicts=('armitage')
provides=('armitage')
install='armitage.install'

source=( "${gitname}::git+https://github.com/rsmudge/armitage"
         'armitage.install' 'armitage.desktop' 'metasploit.png' 'metasploit.sh'
         'database.yml' 'metasploit.service' 'metasploit.default'
         'added-a-services-column-in-the-host-table-view-with-filter.patch'
         'ui-change-menu-items-list-from-8-to-24.patch')

sha256sums=('SKIP'
            'd5a89e87e81e0169652147681a7c17657b8ced14f90e0e38fa15fac4b6ad5a8d'
            '02c829495ebfb171146e2b02f1c2470f814c41b6c80f0649f59ac62609d18689'
            '7d25e47bbd5cd710020c30fb645229a774672c7bcb451a0cf2fd6ba327d8b141'
            '7869413529c5529b9a0f2bcaaa2be1480382c2f91eb505e43a4f9e1c1eab2d71'
            'b4b4e77895712d16ab9d7402ee53fafcb34c667b7394ae7136d6686be8ee1a2f'
            'ac521ad84eddf680c50c90bbeab3de5c3141da856702de8ac8c31e1ef66154e0'
            'df69997f77fb6460d5f7aba0ff5b592eef5890ce52d2f9e2614e8836fc56eade'
            '7d7565a6095de77def21960409a3c57a1583246042af7e21bf6367f0bf23380e'
            '0aa46b5583ba21126eaa60279617af3e8380e6d927b5a836ae7bada7de31a94d')

pkgver() {
  cd "${gitname}"

  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd "${gitname}"

  patch -p1 -i "${srcdir}/added-a-services-column-in-the-host-table-view-with-filter.patch"
  patch -p1 -i "${srcdir}/ui-change-menu-items-list-from-8-to-24.patch"
}

build() {
  cd "${gitname}"

  ant clean
  ant compile
  cp -r resources/ bin/
  cp -r scripts/ bin/
  ant jar
}

package() {
  cd "${gitname}"

  mkdir -p "${pkgdir}/opt/${gitname}" "${pkgdir}/usr/bin"
  cp -rv armitage.jar cortana.jar readme.txt whatsnew.txt dist/unix/* \
    "${pkgdir}/opt/${gitname}"

  cat > "${pkgdir}/opt/${gitname}/armitage" <<-EOF
#!/bin/sh
cd /opt/armitage
java -XX:+UseParallelGC -jar armitage.jar $@
EOF

  ln -s -t "${pkgdir}/usr/bin" "/opt/${gitname}/armitage"

  install -Dm755 "${srcdir}/metasploit.sh" "${pkgdir}/etc/profile.d/metasploit.sh"
  install -Dm644 "${srcdir}/armitage.desktop" "${pkgdir}/usr/share/applications/armitage.desktop"
  install -Dm644 "${srcdir}/metasploit.png" "${pkgdir}/usr/share/icons/metasploit.png"
  install -Dm755 "${srcdir}/metasploit.sh" "${pkgdir}/etc/profile.d/metasploit.sh"
  install -Dm644 "${srcdir}/database.yml" "${pkgdir}/usr/share/metasploit/database.yml.sample"
  install -Dm644 "${srcdir}/metasploit.service" "${pkgdir}/usr/lib/systemd/system/metasploit.service"
  install -Dm644 "${srcdir}/metasploit.default" "${pkgdir}/etc/default/metasploit"
}

# vim:set ts=2 sw=2 et:
