# Maintainer: Pantelis Panayiotou <p.panayiotou@gmail.com>

pkgname="kapitano"
pkgver="1.1.4"
pkgrel="1"
epoch="1"
pkgdesc="Modern ClamAV front-end that uses gtk4/libadwaita"
arch=("any")
url="https://codeberg.org/zynequ/Kapitano"
license=("GPL-3.0-or-later")
depends=("glib2" "gtk4" "libadwaita" "python-gobject" "clamav")
makedepends=("git" "meson" "appstream")
provides=("kapitano")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/zynequ/Kapitano/archive/${pkgver}.tar.gz")
sha256sums=("d118d18a9f6f01aa32a4541184dc96ad77f4810529fb5c9e70089170baf2405d")

prepare() {
  dst="src/config/paths_config.py"
  dst_match="[[:space:]]*USER_DATA_DIR[[:space:]]*=[[:space:]]*GLib.get_user_data_dir()[[:space:]]*"
  dst_replace="USER_DATA_DIR = os.path.join(GLib.get_user_data_dir(), \"kapitano\")"
  dst_append="os.makedirs(USER_DATA_DIR, exist_ok=True)"

  cd "${pkgname}"
  if sed -n "s/${dst_match}/${dst_replace}/gp" "${dst}" | grep -q .
  then
    sed -i "s/${dst_match}/${dst_replace}/g" "${dst}"
    echo -e "\n${dst_append}" >> "${dst}"
  else
    echo "Error patching ${dst}"
    return -1
  fi
}

build() {
  opts=()
  arch-meson build "${pkgname}" "${opts[@]}"
  meson compile -C build
}

package() {
  meson install --destdir "${pkgdir}" -C build
}
