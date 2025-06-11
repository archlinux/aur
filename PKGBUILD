# Maintainer: Noah Ramkissoon nohramkissoon1@gmail.com
pkgname=packinstall-git # Still use -git for VCS packages
_pkgname=Packinstall    # Your GitHub repository name
pkgver=r11.g3a6398e       # Will be updated by the pkgver() function
pkgrel=1
pkgdesc="A simple package installer for Arch Linux using bash and git."
arch=('any')            # Bash scripts are generally architecture-independent
url="https://github.com/rainbownx/Packinstall"
license=('MIT')         # Or whatever license you've chosen
depends=('bash' 'git')  # Basic dependencies for a bash script using git.
                        # Add any other tools your script explicitly calls (e.g., 'curl', 'wget', 'sudo', 'pacman').
makedepends=('git')     # Only 'git' is needed for cloning the repo during build.

source=("git+${url}.git") # Source from your Git repository.
md5sums=('SKIP')        # Use SKIP for Git sources.

pkgver() {
  cd "${srcdir}/${_pkgname}"
  # Ensure the repository is valid for git commands
  git rev-list --count HEAD > /dev/null || return 1
  # Generates version in format: r<commit_count>.g<short_hash>
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
  # For a simple bash script, usually no explicit "build" step is required.
  # The script is ready to be installed as-is.
  return 0 # Simply return success
}

package() {
  cd "${srcdir}/${_pkgname}"

  # Install the main bash script to /usr/bin/
  # The -D flag creates parent directories if they don't exist.
  # The -m755 flag sets executable permissions (read/write/execute for owner, read/execute for group/others).
install -Dm755 "packinstall" "$pkgdir/usr/bin/packinstall"                                                                 # and you want to install it as 'packinstall'

  # Install the LICENSE file to /usr/share/licenses/
  # The -m644 flag sets read-only permissions for others.
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  # If you have man pages, desktop files, or other assets, install them here too:
  # install -Dm644 "packinstall.1" "$pkgdir/usr/share/man/man1/packinstall.1"
  # install -Dm644 "packinstall.desktop" "$pkgdir/usr/share/applications/packinstall.desktop"
}
