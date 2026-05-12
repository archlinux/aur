pkgname=howdy-gesture-tfg
pkgver=0.1.0.r39.g020407f
pkgrel=1
pkgdesc="Howdy + gesture authentication layer (TFG)"
arch=('x86_64')
url="https://github.com/Palm-Pass/tfg"

license=('MIT')
install="${pkgname}.install"
backup=('etc/howdy/config.ini')
depends=(
  'pam'
  'dbus'
  'uv'
  'python'
  'gobject-introspection'
  'cairo'
  'mesa'
)
makedepends=(
  'gcc'
  'git'
  'cmake'
  'gobject-introspection'
)
source=(
  "tfg::git+https://github.com/Palm-Pass/tfg.git#branch=main"
)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/tfg"
  printf '0.1.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/tfg"
}

build() {
  cd "${srcdir}/tfg"
  gcc -fPIC -fno-stack-protector -Wall -c src/pam_gesture.c -o "${srcdir}/pam_gesture.o"
  ld -x --shared -o "${srcdir}/pam_gesture.so" "${srcdir}/pam_gesture.o" -lpam
}

package() {
  local repo="${srcdir}/tfg"
  local root="${pkgdir}/usr/lib/howdy"

  install -d "${root}/models"

  # Core scripts renamed to match pam_gesture.c expectations
  install -m 755 "${repo}/src/compare.py" "${root}/compare-gesture.py"
  install -m 644 "${repo}/src/Authenticate.py" "${root}/Authenticate.py"
  install -m 644 "${repo}/src/Config.py" "${root}/Config.py"
  install -m 644 "${repo}/src/message_print.py" "${root}/message_print.py"
  install -m 644 "${repo}/src/palm_pass_authenticator.py" "${root}/palm_pass_authenticator.py"

  # Supplementary scripts for gesture hints and notifications
  install -m 644 "${repo}/src/palm_pass_hints.py" "${root}/palm_pass_hints.py"
  install -m 644 "${repo}/src/dbus_notification.py" "${root}/dbus_notification.py"
  
  # Binaries
  install -d "${pkgdir}/usr/lib/security"
  install -m 755 "${srcdir}/pam_gesture.so" "${pkgdir}/usr/lib/security/pam_gesture.so"

  # Default config
  install -d "${pkgdir}/etc/howdy"
  install -m 644 "${repo}/config/config.ini" "${pkgdir}/etc/howdy/config.ini"

  # Global binaries and symlinks
  install -d "${pkgdir}/usr/bin"
  install -m 755 "${repo}/src/gesture-config.py" "${pkgdir}/usr/bin/howdy-gesture-config"
  install -m 755 "${repo}/src/gesture-only.py" "${pkgdir}/usr/bin/howdy-gesture-only"
  ln -s /usr/lib/howdy/.venv/bin/howdy "${pkgdir}/usr/bin/howdy"
  
  # Models and dependencies
  install -m 644 "${repo}/models/gesture_recognizer.task" "${root}/models/gesture_recognizer.task"
  install -m 644 "${repo}/pyproject.toml" "${root}/pyproject.toml"
  install -m 644 "${repo}/uv.lock" "${root}/uv.lock"
}
