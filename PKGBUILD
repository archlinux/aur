# Maintainer: SinoCici <hsk6808065@163.com>
pkgname=ideapad2024-power-management
pkgver=0.1.2
pkgrel=1
pkgdesc="Manage power settings for the Lenovo Ideapad 2024 (IdeaPad Pro 5 (Gen 9)) with the CLI tool ideapad2024-power-manage, alongside a system tray icon for convenient access. Remember, you'll need to manually start the tray by executing ideapad2024-power-tray."
arch=("any")
url="https://github.com/Sino-Huang/ideapad2024-power-management"
license=("MIT")
conflicts=('power-profiles-daemon')
install="build.install"
depends=("python" "python-pyqt6" "cpupower" "acpi_call-dkms")
makedepends=("git")
provides=()
conflicts=()
# source=("ideapad2024-power-manage.py" "ideapad2024-power-tray.py" "power_management.png" "99-acquire-acpi-permit.rules" "99-user-automatic-powermode.rules")
source=(
	"$url/archive/refs/tags/$pkgver.tar.gz"
)

sha256sums=('4919a8c5f67ce5357df75f8d51c5c76862d8c36372bd76c68d6a6f5f2e89e3ab')

build() {
	# at this point the user can still be captured by $(whoami)
	if [ -d "$srcdir/$pkgname-$pkgver" ]; then
		cd "$srcdir/$pkgname-$pkgver"
		echo "Changed directory to $srcdir/$pkgname-$pkgver"
	else
		cd "$srcdir"
		echo "Changed directory to $srcdir"
	fi

	# we need to put the following to the /etc/sudoers.d/01_$(whoami)_ideapad2024-power-management
	# $(whoami) ALL=(ALL) NOPASSWD: /usr/bin/cpupower frequency-set -g powersave
	# $(whoami) ALL=(ALL) NOPASSWD: /usr/bin/cpupower frequency-set -g schedutil

	pred="# editted by ideapad2024-power-management"
	l1="$(whoami) ALL=(ALL) NOPASSWD: /usr/bin/cpupower frequency-set -g powersave"
	l2="$(whoami) ALL=(ALL) NOPASSWD: /usr/bin/cpupower frequency-set -g schedutil"
	l3="$(whoami) ALL=(ALL) NOPASSWD: /usr/bin/cpupower frequency-set -g performance"
	post="# end of editted by ideapad2024-power-management"

	echo $pred | sudo tee 01_$(whoami)_ideapad2024-power-management
	echo $l1 | sudo tee -a 01_$(whoami)_ideapad2024-power-management
	echo $l2 | sudo tee -a 01_$(whoami)_ideapad2024-power-management
	echo $l3 | sudo tee -a 01_$(whoami)_ideapad2024-power-management
	echo $post | sudo tee -a 01_$(whoami)_ideapad2024-power-management
	echo $(whoami) | tee whoami.txt

}

package() {
	# Note that $(whoami) is not available here
	if [ -d "$srcdir/$pkgname-$pkgver" ]; then
		cd "$srcdir/$pkgname-$pkgver"
		echo "Changed directory to $srcdir/$pkgname-$pkgver"
	else
		cd "$srcdir"
		echo "Changed directory to $srcdir"
	fi
	username=$(cat "whoami.txt")
	install -Dm 755 "ideapad2024-power-manage.py" "${pkgdir}/usr/bin/ideapad2024-power-manage"

	install -Dm 755 "ideapad2024-power-tray.py" "${pkgdir}/usr/bin/ideapad2024-power-tray"

	install -Dm 644 "power_management.png" "${pkgdir}/usr/share/${pkgname}/power_management.png"

	install -Dm 644 "99-acquire-acpi-permit.rules" "${pkgdir}/etc/udev/rules.d/99-acquire-acpi-permit.rules"

	install -Dm 644 "99-user-automatic-powermode.rules" "${pkgdir}/etc/udev/rules.d/99-user-automatic-powermode.rules"

	install -Dm 644 "01_${username}_ideapad2024-power-management" "${pkgdir}/etc/sudoers.d/01_${username}_ideapad2024-power-management"

	# modify acpi_call permission in the build.install script, otherwise it will not work because build and package are done in virtual environment
}

