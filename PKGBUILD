# PKGBUILD for My JSON Formatter (my-json-formatter)

# Maintainer: Your Name <your_email@example.com>
pkgname=json-formatter-gui
pkgver=0.1.0       # Match your application's version
pkgrel=3           # Package release number, increment for PKGBUILD changes
pkgdesc="A cross-platform desktop application for formatting JSON and executing JQ queries."
arch=('x86_64')    # Specify architectures. For Rust, 'aarch64' also common.
url="https://github.com/k161196/json-formatter-gui" # Your project's repository URL
license=('MIT')    # Or your chosen license (e.g., 'GPL', 'Apache')
depends=(           # Runtime dependencies
    'jq'            # Your app uses JQ externally
    'libxkbcommon'  # Common eframe dependency
    'alsa-lib'      # Common eframe dependency
    'wayland'       # Common eframe dependency
)
makedepends=(       # Build-time dependencies
    'git'           # To clone your source
    'rust'          # Rust compiler
    'cargo'         # Rust package manager
    'cmake'         # often needed by native libs
    'pkg-config'    # often needed by native libs
)
# source=("git+${url}.git#tag=v${pkgver}") # Fetch source from git tag
source=("git+${url}.git#branch=main") # Or 'master' if that's your main branch
# If you don't use tags, use branch: source=("git+${url}.git#branch=main")
# Or a specific commit: source=("git+${url}.git#commit=YOUR_COMMIT_HASH")

# Add your desktop file and icon to source array if they are not in the main repo
# If they are in the repo, specify their path in package()
source+=(
    "${pkgname}.desktop"
    "${pkgname}.png" # Or .svg, make sure name matches your icon file
)

sha256sums=(
    'SKIP' # Use 'SKIP' for git sources as the hash changes with each commit/tag.
           # If you use static tarballs, you'd calculate actual sums here.
    'SKIP' # For .desktop file
    'SKIP' # For .png icon
)

build() {
    cd "${srcdir}/${pkgname}" # Change into the cloned repository directory
    # Build your Rust application in release mode
    # Ensure all features for your eframe app are enabled if applicable
    cargo build --release --locked --all-features
}

package() {
    # Install the compiled binary
    # -D creates parent directories if they don't exist
    # -m sets permissions (755 for executable)
    install -Dm755 "${srcdir}/${pkgname}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    # Install the desktop entry file
    # -m sets permissions (644 for data files)
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Install the icon
    # Replace 'scalable' with an appropriate size like '128x128' if your icon is fixed size.
    install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.png"

    # You might also want to install man pages if you have them:
    # install -Dm644 "${srcdir}/${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}
