# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=android-completion
pkgver=20200829.f60d4f9
pkgrel=1
pkgdesc="Bash completion for adb and fastboot"
arch=('any')
url="https://android.googlesource.com/platform/system/core/"
license=('Apache')
depends=(adb bash-completion)
conflicts=(android-bash-completion)
_commit=${pkgver#*.}
source=("adb.bash.b64::https://android.googlesource.com/platform/system/core/+/$_commit/adb/adb.bash?format=TEXT"
	"fastboot.bash.b64::https://android.googlesource.com/platform/system/core/+/$_commit/fastboot/fastboot.bash?format=TEXT")
sha512sums=('450cdf58661537b0d1fcdf191a6b635ac87eb3cfeb3187106409bb92f71ae0b73df27a0fa2c7b1a2e16552ed04e6b0660e88e737058abf6b97051558564d85fb'
            '7a386704e5cb02ffcc921e3f6db81401ec292dcd18374bae9cdd68d086baf52905cc2db75c3f661eb06fdc1a8401f2cc40b7ba9dd249be4e235052a003ca90b5')

pkgver() {
	head=$(curl -sSf 'https://android.googlesource.com/platform/system/core/+/HEAD?format=JSON' | sed 's/$/\\n/' | tr -d '\n')
	commit=$(echo -e $head | grep -oP '^\s*"commit":\s*"\K[0-9a-f]+(?=",?)')
	timestamp=$(echo -e $head | grep -A3 '^\s*"committer":\s*{' | grep -oP '^\s*"time":\s*"\K.+(?=",?)')
	month=$(echo $timestamp | cut -d' ' -f2)
	day=$(echo $timestamp | cut -d' ' -f3)
	time=$(echo $timestamp | cut -d' ' -f4)
	year=$(echo $timestamp | cut -d' ' -f5)
	timezone=$(echo $timestamp | cut -d' ' -f6)
	printf "%s.%s" $(date -d "$day $month $year $time $timezone" +%Y%m%d) ${commit:0:7}
}

prepare() {
	cd "$srcdir"
	for i in adb fastboot; do
		base64 -d $i.bash.b64 > $i.bash
		sed -i 's/check_type/type -t/g' $i.bash
	done
}

package() {
	for i in adb fastboot; do
		install -Dm644 -t "$pkgdir/usr/share/bash-completion/completions/" "$srcdir/$i.bash"
	done
}
