# Maintainer: Yahya Zekry <yahyazekry@gmail.com>

pkgname=internet-usage-monitor-git
_pkgname_src=internet-usage-monitor # This is the actual directory name of the source code
pkgver=0.0.0.r0.dev # Placeholder static pkgver

pkgver() {
  cd "$_pkgname_src"
  # Generates a version like 0.0.r<commit_count>.<short_hash>
  printf "0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="Monitors internet usage in real-time via Conky with desktop notifications (git version)"
arch=('any')
provides=("internet-usage-monitor=${pkgver}")
conflicts=('internet-usage-monitor')
url="https://github.com/YahyaZekry/internet-usage-monitor"
license=('MIT')
depends=('bash' 'conky' 'bc' 'procps-ng' 'libnotify' 'zenity')
makedepends=('git')
source=("${_pkgname_src}::git+${url}.git#branch=main") # Source from main branch
# Or if you want to package a specific release/tag:
# source=("${_pkgname_src}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
# Note: The source array uses _pkgname_src for the directory, which is correct.
# pkgname is internet-usage-monitor-git, but the source repo is internet-usage-monitor.
sha256sums=('SKIP') # For VCS sources, or provide checksum for tarball

prepare() {
  # This is where you would apply patches or run sed commands if the scripts
  # were not modified directly in the source repo before packaging.
  # Since we've "modified" them as part of the plan, if these changes
  # are committed to the git repo, this step might not be needed.
  # If the source scripts are fetched unmodified, then sed commands to
  # implement XDG changes would go here, operating on files in "$srcdir/$_pkgname_src/"
  echo "Skipping prepare(), assuming scripts in repo are already XDG compliant or will be."
}

package() {
  cd "$_pkgname_src"

  # Install scripts to /usr/bin
  install -Dm755 "src/internet_monitor.sh" "$pkgdir/usr/bin/internet_monitor.sh"
  install -Dm755 "src/conky_usage_helper.sh" "$pkgdir/usr/bin/conky_usage_helper.sh"
  install -Dm755 "src/internet_monitor_daemon.sh" "$pkgdir/usr/bin/internet_monitor_daemon.sh"

  # Install default config and conkyrc to /usr/share/pkgname
  install -Dm644 "config/config.sh" "$pkgdir/usr/share/$pkgname/config.sh"
  install -Dm644 "config/conkyrc_internet" "$pkgdir/usr/share/$pkgname/conkyrc_internet"
  
  # Install license
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # Install README (optional, but good practice)
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  
  # Install .install script if created
  # install -Dm644 "../${pkgname}.install" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook" # Incorrect for .install
  # Correct way for .install is just to have it alongside PKGBUILD, makepkg handles it.
}
