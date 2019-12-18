# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
projectname=skycoin
pkgname=skycoin-explorer
pkgname1=skycoin
githuborg=skycoinproject
pkgdesc="Skycoin Blockchain Explorer. explorer.skycoin.com"
pkgver='auogenerated'
pkggopath="github.com/${githuborg}/${pkgname}"
pkgrel=2
arch=('any')
url="https://${pkggopath}"
license=()
makedepends=(git go gcc npm node-gyp)
source=("git+${url}.git#branch=${BRANCH:-develop}"
"https://raw.githubusercontent.com/0pcom/skycoin_archlinux_packages/master/key")
sha256sums=('SKIP'
'41c0a4a42ae64479b008392053f4a947618acd6bb9c3ed2672dafdb2453caa14')
#validpgpkeys=('DE08F924EEE93832DABC642CA8DC761B1C0C0CFC')
gpg --import key
#verify PKGBUILD signature
gpg --verify ../PKGBUILD.sig ../PKGBUILD
pkgver() {
  cd "${srcdir}/${pkgname}"
  local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
  local count=$(git rev-list --count HEAD)
  local commit=$(git rev-parse --short HEAD)
  echo "${date}.${count}_${commit}"
}

export GOOS=linux
export GOPATH="${srcdir}"
export CGO_ENABLED=0

case "$CARCH" in
x86)      export GOARCH="386" GO386="387" ;;
x86_64)   export GOARCH="amd64" ;;
arm*)     export GOARCH="arm" ;;
armel)    export GOARCH="arm" GOARM="5" ;;
armhf)    export GOARCH="arm" GOARM="6" ;;
armv7)    export GOARCH="arm" GOARM="7" ;;
armv8)    export GOARCH="arm64" ;;
aarch64)  export GOARCH="arm64" ;;
mips)     export GOARCH="mips" ;;
mips64)   export GOARCH="mips64" ;;
mips64el) export GOARCH="mips64le" ;;
mipsel)   export GOARCH="mipsle" ;;
*)        return 1 ;;
esac

build () {
  msg2 'installing go dependencies'
  export GOPATH="${srcdir}"/go
  export GOBIN=${GOPATH}/bin
  export PATH=${GOPATH}/bin:${PATH}

  mkdir -p ${srcdir}/go/src/${pkggopath//${pkgname}/} ${srcdir}/go/bin

  ln -rTsf ${srcdir}/${pkgname} ${srcdir}/go/src/${pkggopath}
  cd ${srcdir}/go/src/${pkggopath}/
  git checkout develop
  git submodule --quiet update --init --recursive
  rm -rf Gopkg.toml
  rm -rf Gopkg.lock
  go install \
  -gcflags "all=-trimpath=${GOPATH}" \
  -asmflags "all=-trimpath=${GOPATH}" \
  -ldflags "-extldflags ${LDFLAGS}" \
  -v ./...
  #build the UI
  npm install
  npm audit fix
  npm install --save-dev @angular-devkit/build-angular
  make build-ng

  cd ${srcdir}/go
  echo -e '[Unit]
 Description=Skycoin Node service
 After=network.target
 After=network-online.target

 [Service]
 Type=oneshot
 ExecStart=/usr/bin/skycoin-explorer-nohup
 RemainAfterExit=yes
 ExecStop=/usr/bin/skycoin-halt
 TryExec=/usr/bin/skycoin

 [Install]
 WantedBy=multi-user.target ' > ${pkgname}.service
}


package() {
  options=(!strip staticlibs)
  #create directory trees
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/lib/${projectname}/go/bin
  mkdir -p ${pkgdir}/usr/lib/${projectname}/${pkgname}/
  #restate go envs
  export GOPATH=${pkgdir}/usr/lib/${projectname}/go
  export GOBIN=${pkgdir}/usr/lib/${projectname}/go/bin
  #install binaries & symlink to /usr/bin
  msg2 'installing binaries'
  skybins="${srcdir}"/go/bin
  potentialnameconflicts=$( ls --ignore=skycoin* "$skybins")
  cd ${skybins}
  for i in ${potentialnameconflicts}; do
    mv ${skybins}/${i} ${skybins}/${pkgname1}-$i
  done
  #create the launcher script
  echo -e '#!/bin/bash
#launch skycoin explorer more easily
export GOBIN=/usr/lib/skycoin/go/bin
export GOPATH=/usr/lib/skycoin/go
export GOBIN=$GOPATH/bin
nohup skycoin -gui-dir=/usr/lib/skycoin/skycoin/src/gui/static/ -launch-browser=true -enable-all-api-sets=true -enable-gui=true -rpc-interface=false -log-level=debug > /dev/null 2>&1 &cd /usr/lib/skycoin/skycoin-explorer \n echo "Please enter the port that skycoin wallet is running on:" \n read port \n SKYCOIN_ADDR=http://127.0.0.1:$port skycoin-explorer' > ${pkgname}-launch
  chmod +x ${pkgname}-launch
  echo -e '#!/bin/bash
#launch skycoin explorer more easily
export GOBIN=/usr/lib/skycoin/go/bin
export GOPATH=/usr/lib/skycoin/go
export GOBIN=$GOPATH/bin
nohup skycoin -gui-dir=/usr/lib/skycoin/skycoin/src/gui/static/ -launch-browser=true -enable-all-api-sets=true -enable-gui=true -rpc-interface=false -log-level=debug > /dev/null 2>&1 &cd /usr/lib/skycoin/skycoin-explorer \n  SKYCOIN_ADDR=http://127.0.0.1:6420 nohup skycoin-explorer > /dev/null 2>&1 &cd' > ${pkgname}-nohup
  chmod +x ${pkgname}-nohup
  skycoinbins=$( ls "$skybins")
  for i in ${skycoinbins}; do
    install -Dm755 ${srcdir}/go/bin/${i} ${pkgdir}/usr/lib/${projectname}/go/bin/${i}
    ln -rTsf ${pkgdir}/usr/lib/${projectname}/go/bin/${i} ${pkgdir}/usr/bin/${i}
    chmod 755 ${pkgdir}/usr/bin/${i}
  done
  rm -rf ${srcdir}/${pkgname}/.git
  cp -r ${srcdir}/${pkgname}/ ${pkgdir}/usr/lib/${projectname}/
  install -Dm644 ${srcdir}/go/${pkgname}.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service

}
