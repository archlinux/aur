# Maintainer: relrelb <relrelbachar@gmail.com>
pkgname=android-completion
pkgver=20200805.a39e39fe3
pkgrel=1
pkgdesc="Bash completion for adb and fastboot"
arch=(any)
url="https://android.googlesource.com/platform/system/core/"
license=('GPL')
depends=('android-sdk-platform-tools' 'bash' 'bash-completion')
_commit=$(echo $pkgver | cut -d. -f2)
source=("adb.bash.b64::https://android.googlesource.com/platform/system/core/+/$_commit/adb/adb.bash?format=TEXT"
	"fastboot.bash.b64::https://android.googlesource.com/platform/system/core/+/$_commit/fastboot/fastboot.bash?format=TEXT"
	"$pkgname.patch")
sha512sums=('450cdf58661537b0d1fcdf191a6b635ac87eb3cfeb3187106409bb92f71ae0b73df27a0fa2c7b1a2e16552ed04e6b0660e88e737058abf6b97051558564d85fb'
            '7a386704e5cb02ffcc921e3f6db81401ec292dcd18374bae9cdd68d086baf52905cc2db75c3f661eb06fdc1a8401f2cc40b7ba9dd249be4e235052a003ca90b5'
            'da0cfc049bfcb1cf1c3baf274079f146efb2abc30863c585a8f4221aca5292c9de2a7e57efe808dfbf3ef2aa3c340b19bba01f23ce77ed4ef62bb9b9afe4ef5a')

pkgver() {
	head=$(curl -sSf 'https://android.googlesource.com/platform/system/core/+/HEAD?format=JSON' | sed 's/$/\\n/' | tr -d '\n')
	commit=$(echo -e $head | grep -oP '^\s*"commit":\s*"\K[0-9a-f]+(?=",?)')
	timestamp=$(echo -e $head | grep -A3 '^\s*"committer": {' | grep -oP '^\s*"time":\s*"\K.+(?=",?)')
	month=$(echo $timestamp | cut -d' ' -f2)
	day=$(echo $timestamp | cut -d' ' -f3)
	time=$(echo $timestamp | cut -d' ' -f4)
	year=$(echo $timestamp | cut -d' ' -f5)
	timezone=$(echo $timestamp | cut -d' ' -f6)
	printf "%s.%s" $(date -d "${day} ${month} ${year} ${time} ${timezone}" +%Y%m%d) ${commit:0:9}
}

prepare() {
	cd "$srcdir"
	for i in adb fastboot; do
		base64 -d $i.bash.b64 > $i.bash
	done
	patch -p2 -i "$pkgname.patch"
}

package() {
	for i in adb fastboot; do
		install -Dm644 "$srcdir"/$i.bash "$pkgdir"/usr/share/bash-completion/completions/$i.bash
	done
}
