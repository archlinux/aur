# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname=minecraft-launcher-arm
pkgver=r9.abb58ce
pkgrel=1
pkgdesc='Minecraft Java Edition for ARM devices using Legacy Launcher'
arch=('aarch64' 'armv7h')
license=('All Rights Reserved')
depends=('glibc' 'libx11' 'freetype2' 'glib2' 'opengl-driver')
depends_aarch64=('jre11-openjdk')
source=("https://launcher.mojang.com/v1/objects/eabbff5ff8e21250e33670924a0c5e38f47c840b/launcher.jar"
        "https://launcher.mojang.com/download/minecraft-launcher.svg"
        "minecraft-launcher.desktop")
source_aarch64=("https://github.com/mikehooper/Minecraft/raw/main/jdk-8u251-linux-arm64-vfp-hflt.tar.gz"
                "https://github.com/mikehooper/Minecraft/raw/main/lwjgl3arm64.tar.gz"
                "minecraft-launcher-arm64.sh")
source_armv7h=("https://github.com/mikehooper/Minecraft/raw/main/jdk-8u251-linux-arm32-vfp-hflt.tar.gz"
               "https://github.com/mikehooper/Minecraft/raw/main/lwjgl2arm32.tar.gz"
               "https://github.com/mikehooper/Minecraft/raw/main/lwjgl3arm32.tar.gz"
               "minecraft-launcher-arm32.sh")
sha256sums=('d98de795667f666652e4d0f453708c51292cc326860f387ae8fdfc7cbaf33ca1'
            '35c2bcaeb09fa4b8864e9422fd66bf60847706f8b4400ec4a66ba6436b101f71'
            '431040831069a1ea867cb7c6f708e3c8f5788fb3d3e41d068f8afbef60cfafbd')
sha256sums_aarch64=('58baeaab7da97dd5a6b02ad2dcd77c14b3b6ba014029ee67dbc2bd5f0fa98d1b'
                    'f368a605c8a6837d6cf93a41085162c31bcad5108663942e8d8b7dd3c5c34b41'
                    '576b43444c7fc3a39ed99a65e7fcd8028464bde7b5982bf22abd5cb110219ba9')
sha256sums_armv7h=('f1b0c979e1b61ec52ebd5e1d0b754d7681d8623b09ac90c69718a553ef9b0cd1'
                   'f044a8dc8764868d769748d29868879858fe16e1012fe5f1317328a3bfa2fe48'
                   'b52d98f247deb35a192df83a23e5565df17375322f633453c8358cdd3dd3d90a'
                   '9278716094e7f017c18a581ea8edb9537ffd00757b9c6b815225a97e7a9aff76')
noextract=('jdk-8u251-linux-arm32-vfp-hflt.tar.gz' 'jdk-8u251-linux-arm64-vfp-hflt.tar.gz' 'lwjgl3arm32.tar.gz' 'lwjgl3arm32.tar.gz' 'lwjgl2arm32.tar.gz')
install='minecraft-launcher-arm.install'

package() {
	if [ "$(uname -m)" = "aarch64" ]; then
	    _BITS=64
	else
	    _BITS=32
	fi
	mkdir -p "$pkgdir/"opt/minecraft/lwjgl3arm${_BITS}
	if [ "${BITS}" == "32" ]; then
	    mkdir -p "$pkgdir/opt/minecraft/lwjgl2arm32"
	fi
	mkdir -p /opt/jdk
	install -Dm644 launcher.jar "$pkgdir/opt/minecraft/launcher.jar"
	install -Dm755 minecraft-launcher-arm${_BITS}.sh "$pkgdir/usr/bin/minecraft-launcher"
	install -Dm644 minecraft-launcher.svg "$pkgdir/usr/share/pixmaps/minecraft-launcher.svg"
	install -Dm644 minecraft-launcher.desktop "$pkgdir/usr/share/applications/minecraft-launcher.desktop"
	bsdtar -xv -C "$pkgdir/opt/jdk" -f jdk-8u251-linux-arm${_BITS}-vfp-hflt.tar.gz
	bsdtar -xv -C "$pkgdir/"opt/minecraft/lwjgl3arm${_BITS} -f lwjgl3arm{_BITS}.tar.gz
	if [ "${_BITS}" == "32" ]; then
	    bsdtar -xv -C "$pkgdir/opt/minecraft/lwjglarm32" -f lwjgl2arm32.tar.gz
	fi
}
