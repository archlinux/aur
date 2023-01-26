# Maintainer: Isaac Ruben <isaac at rubenfamily dot com>
pkgname='photonvision-bin'
pkgver="v2023.2.1"
pkgrel=1
pkgdesc="free, fast, and easy-to-use computer vision solution for the FIRST Robotics Competition"
arch=("x86_64")
url="https://photonvision.org/"
license=('GPL3')
source=("$pkgname-$pkgver.jar::https://github.com/PhotonVision/photonvision/releases/download/$pkgver/photonvision-$pkgver-linuxx64.jar")
noextract=("$pkgname-$pkgver.jar")
sha256sums=('82f8249888e6fc693e4116899511e294a98b9e6dfbf259dabceefb1645ee25f1')
depends=('jre11-openjdk-headless' 'avahi')

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
ExecStart=/usr/lib/jvm/java-11-openjdk/bin/java -Xmx512m -jar /opt/$pkgname/photonvision.jar
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
  install -Dm644 "$pkgname-$pkgver.jar" "$pkgdir/opt/$pkgname/photonvision.jar"

	# copy the systemd service file
	install -Dm644 photonvision.service "$pkgdir/etc/systemd/system/photonvision.service"
}
