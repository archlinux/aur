# Maintainer: Isaac Ruben <isaac at rubenfamily dot com>
# Maintainer: Ian Hartwig <mail at ihartwig dot me>
# Maintainer: baguette <baguettesabot at gmail dot com>
pkgname='photonvision-bin'
pkgver="v2025.1.1"
pkgrel=2
pkgdesc="free, fast, and easy-to-use computer vision solution for the FIRST Robotics Competition"
arch=('x86_64' 'aarch64')
url="https://photonvision.org/"
license=('GPL3')
pkgurlver="v2025.1.1"
source=()
noextract=("$pkgname-$pkgurlver.jar")
source_x86_64=("$pkgname-$pkgurlver.jar::https://github.com/PhotonVision/photonvision/releases/download/$pkgurlver/photonvision-$pkgurlver-linuxx64.jar")
sha256sums_x86_64=('d8b2d874c037da6c7560851a0210904d79b5f80fa9d1694fd355718a8e6c0f70')
sha256sums_aarch64=('d8b2d874c037da6c7560851a0210904d79b5f80fa9d1694fd355718a8e6c0f70')
source_aarch64=("$pkgname-$pkgurlver.jar::https://github.com/PhotonVision/photonvision/releases/download/$pkgurlver/photonvision-$pkgurlver-linuxarm64.jar")
depends=('jre17-openjdk-headless' 'avahi' 'networkmanager')
depends_x86_64=('linux-lts')
depends_aarch64=()
install="photonvision-bin.install"

prepare() {
	# pulled from https://raw.githubusercontent.com/PhotonVision/photonvision/master/scripts/install.sh
	# and slightly modified to work better with arch
	cat > photonvision.service << EOF
[Unit]
Description=Service that runs PhotonVision

[Service]
WorkingDirectory=/opt/$pkgname
# Run photonvision at "nice" -10, which is higher priority than standard
Nice=-10
# for non-uniform CPUs, like big.LITTLE, you want to select the big cores
# look up the right values for your CPU
# AllowCPUs=4-7

# modified to use the jre11-openjdk-headless package, instead of whatever java version is configured
ExecStart=/usr/lib/jvm/java-17-openjdk/bin/java -Xmx512m -jar /opt/$pkgname/photonvision.jar
ExecStop=/bin/systemctl kill photonvision
Type=simple
Restart=on-failure
RestartSec=1

[Install]
WantedBy=multi-user.target
EOF
}

package() {
	cd "$srcdir"

	# copy the jar file
	install -Dm644 "$pkgname-$pkgurlver.jar" "$pkgdir/opt/$pkgname/photonvision.jar"

	# copy the systemd service file
	install -Dm644 photonvision.service "$pkgdir/etc/systemd/system/photonvision.service"
}
