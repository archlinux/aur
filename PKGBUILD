# --- Metadata ---
pkgname=shelly-shell
_pkgname=shelly-shell
# This is a placeholder, pkgver() function will update it
pkgver=v0.1.0.r0.gf23795f 
pkgrel=1
pkgdesc="QML files for the Shelly desktop environment"
arch=('any') # 'any' arch because they are just QML/text files
url="https://github.com/manpreet113/shelly-shell" # Your repo
license=('MIT') # Make sure this matches your repo's license
depends=('quickshell') # This is a dependency
makedepends=('git') # 'git' is needed to clone
conflicts=($_pkgname)
provides=($_pkgname)

# --- Source ---
# This tells makepkg to clone this git repo
source=("git+$url.git")
# For -git packages, we don'T check hashes
sha256sums=('SKIP') 

# --- Versioning ---
# This function runs automatically to create a proper
# version number like 'r24.g1a2b3c4'
pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

# --- Build/Package ---
# We don't need a build() function since we aren't compiling

# This function puts the files in the final package
package() {
  cd "$_pkgname" # Go into the cloned git repo
  
  # This is the destination for system-wide quickshell projects
  local install_path="${pkgdir}/usr/share/quickshell/${_pkgname}"

  # Create the directory
  install -d "${pkgdir}/usr/share/quickshell/${_pkgname}"
  
  # Copy all files from the repo into that directory
  cp -r ./* "${install_path}/"
  
  # Clean up the .git folder so it's not in the final package
  rm -rf "${install_path}/.git"
}
