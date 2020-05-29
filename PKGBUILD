# Maintainer: somekool <somekool _ at _ gmail _ dot _com>

pkgname=netvirt-agent-git
srcgiturl=https://github.com/mathieujobin/netvirt
pkgver=v2.0.2b
pkgrel=1
pkgdesc="NetVirt is an open source network virtualization platform (NVP)."
arch=('i686' 'x86_64')
url="http://netvirt.org"
license=('GPLv3')
depends=('jansson' 'curl' 'libevent' 'openssl')
optdepends=() # 'qt4'
makedepends=('git' 'scons' 'cmake')
source=("${pkgname}::git+${srcgiturl}.git")
md5sums=('SKIP')

pkgver() {
  gitinfo=`git ls-remote ${srcgiturl} | sort -Vk2`
  sha=`echo "$gitinfo" | head -n 1 | cut -c -7`
  tag=`echo "$gitinfo" | tail -n 1 | awk -F "/" {'print $3'}`
  commits=`curl -s ${srcgiturl}/releases/tag/${tag} | grep -o "[0-9]* commits" | awk {'print $1'}`
  if [ "$commit" = "" ]; then
    printf $tag
  else
    printf "%s.r%s.g%s" $tag $commits $sha
  fi

}

prepare() {
  cd ${srcdir}/${pkgname}
  set -e
  git checkout patch-1
  git submodule update --init --recursive

  pushd tapcfg
  ./buildall.sh linuxonly || true > /dev/null
  popd
  set +e
  echo ======================== prepare completed ========================
}

build() {
  [ -d ${srcdir}/${pkgname}/build ] && rm -fr ${srcdir}/${pkgname}/build
  mkdir ${srcdir}/${pkgname}/build
  cd ${srcdir}/${pkgname}/build
  cmake .. -DCMAKE_INSTALL_PREFIX:PATH=${pkgdir}/usr -DWITH_GUI=OFF
  make nvagent
  echo ======================== build completed ========================
}

package() {
  cd ${srcdir}/${pkgname}/build
  make install

  #TODO: this could/should become a post_install item
  echo "#!/bin/sh
  sudo chmod 666 /dev/net/tun
  sudo setcap cap_net_bind_service,cap_net_admin=ep /usr/bin/netvirt-agent2
  " > ${pkgdir}/usr/bin/netvirt-allow_user

  mkdir -p ${pkgdir}/usr/lib/systemd/system

  # ArchLinux uses SystemD, Yeah
  cat << EOF > ${pkgdir}/usr/lib/systemd/system/netvirt-agent2.service
[Unit]
Description=Netvirt Agent2
After=network.target

[Service]
Environment="HOME=/root"
ExecStart=/usr/bin/netvirt-agent2
ExecReload=/bin/kill -HUP $MAINPID
KillMode=process
Restart=always

[Install]
WantedBy=multi-user.target

EOF

}

