# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
pkgname=btcpayserver
_pkgname=${pkgname}
pkgdesc="Accept Bitcoin payments. Free, open-source and self-hosted Bitcoin payment processor."
pkgver='1.0.7.2'
pkgpath="github.com/${pkgname}/${pkgname}"
pkgrel=1
arch=('any')
url="https://github.com/btcpayserver/${_pkgname}"
license=("MIT")
depends=("aspnet-runtime-3.1" "bitcoin-daemon" "dotnet-sdk-3.1" "lnd" "tmux" "nbxplorer")
optdepends=("apache: HTTP server"
"certbot: Creates SSL certificates."
"nginx: HTTP server"
"mariadb: Database"
"postgresql: Database"
"sqlite: Database")
source=("$url/archive/v${pkgver}.tar.gz"
"https://aur.archlinux.org/cgit/aur.git/plain/README.md?h=btcpayserver-git")
#https://github.com/btcpayserver/btcpayserver/archive/v1.0.7.2.tar.gz
sha256sums=('265484d7e6c525de863566086611b9fe3d5157f940b5cbbb62a521c09f4a0878'
            'e19fd0ca93b23fcf52b6189b035937af37ebd0bb06c45636babe6249c1dbf6fe')

build() {
  mv README.md?h=btcpayserver-git README.md
mv ${srcdir}/${pkgname}-${pkgver} ${srcdir}/${pkgname}
cd ${srcdir}/${pkgname}
./build.sh

##set absolute path in run.sh
#echo -e '#!/bin/bash
##launch btcpayserver
#dotnet run --no-launch-profile --no-build -c Release -p "/usr/lib/btcpayserver/BTCPayServer/BTCPayServer.csproj" -- $@
#' > run.sh
#chmod +x run.sh

#echo -e '#!/bin/bash
##launch nbxplorer
#nohup dotnet run --no-launch-profile --no-build -c Release -p "/usr/lib/btcpayserver/BTCPayServer/BTCPayServer.csproj" -- $@ > /dev/null 2>&1 &sleep 3
#' > run1.sh
#chmod +x run1.sh

#Make a systemd service
echo -e '[Unit]
Description=Btcpayserver
After=network.target
After=nbxplorer.service

[Service]
Type=oneshot
ExecStart=/usr/bin/btcpayserver
RemainAfterExit=yes
Restart=on-failure
#User=

[Install]
WantedBy=multi-user.target
' > btcpayserver.service
}

package() {
  # Assure that the folders exist.
  mkdir -p ${pkgdir}/usr/bin/
  mkdir -p ${pkgdir}/usr/lib/
  mkdir -p ${pkgdir}/usr/share/doc/${_pkgname}/
  mkdir -p ${pkgdir}/usr/share/licenses/${_pkgname}/

  # Modify run.sh to state the absolute path of the .csproj.
  echo -e "#!/bin/bash
  dotnet run --no-launch-profile --no-build -c Release -p \"/usr/lib/${_pkgname}/BTCPayServer/BTCPayServer.csproj\" -- ${@}" > ${srcdir}/${_pkgname}/run.sh

  # Create btcpayserver-start.sh.
  echo -e "#!/bin/bash
  tmux new-session -s ${_pkgname} -d \"${_pkgname};bash -i\"" > ${srcdir}/${_pkgname}/${_pkgname}-start.sh

  # Create btcpayserver-stop.sh.
  echo -e "#!/bin/bash
  tmux kill-session -t ${_pkgname}" > ${srcdir}/${_pkgname}/${_pkgname}-stop.sh

  # Install the software.
  cp -r ${srcdir}/${_pkgname}/ ${pkgdir}/usr/lib/

  ## Symlinking the scripts.
  ln -sfrT ${pkgdir}/usr/lib/${_pkgname}/run.sh ${pkgdir}/usr/bin/${_pkgname}
  chmod 755 ${pkgdir}/usr/bin/${_pkgname}
  ln -sfrT ${pkgdir}/usr/lib/${_pkgname}/${_pkgname}-start.sh ${pkgdir}/usr/bin/${_pkgname}-start
  chmod 755 ${pkgdir}/usr/bin/${_pkgname}-start
  ln -sfrT ${pkgdir}/usr/lib/${_pkgname}/${_pkgname}-stop.sh ${pkgdir}/usr/bin/${_pkgname}-stop
  chmod 755 ${pkgdir}/usr/bin/${_pkgname}-stop

  # Install the documentation.
  install -Dm644 ${srcdir}/README.md ${pkgdir}/usr/share/doc/${_pkgname}/

  # Install the license.
  install -Dm644 ${srcdir}/${_pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/

  # Information
  echo -e "\033[0;32mConfiguration is needed after the installation. For assistance, read the included \"README.md\".\033[0m"
}
