# Maintainer: Steve Holvoet <linux@steho.be>
pkgname=ghidra-mcp-git
pkgver=5.14.2.r45.g60660e2
pkgrel=2
pkgdesc="Production-ready Model Context Protocol server for Ghidra reverse engineering platform (latest git version)"
arch=('any')
url="https://github.com/bethington/ghidra-mcp"
license=('Apache-2.0')
depends=('ghidra' 'python' 'python-mcp')
makedepends=('maven' 'jdk-openjdk' 'git' 'python-build' 'python-installer' 'python-hatchling' 'python-wheel')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "${pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')
install=ghidra-mcp.install

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"

  # Standard Arch Linux path for Ghidra
  local _ghidra_home="/opt/ghidra"
  
  if [ -d "/usr/share/ghidra" ]; then
    _ghidra_home="/usr/share/ghidra"
  fi
  
  msg2 "Using Ghidra installation at: ${_ghidra_home}"

  if [ ! -f "${_ghidra_home}/Ghidra/application.properties" ]; then
    error "Ghidra properties not found at ${_ghidra_home}/Ghidra/application.properties"
    return 1
  fi

  local _detected_version
  _detected_version=$(grep "application.version=" "${_ghidra_home}/Ghidra/application.properties" | cut -d= -f2 | tr -d '\r')
  
  if [ -n "$_detected_version" ]; then
    msg2 "Found Ghidra version: ${_detected_version}"
    # Patch pom.xml to target installed Ghidra version
    sed -i "s|<ghidra.version>.*</ghidra.version>|<ghidra.version>${_detected_version}</ghidra.version>|g" pom.xml
  else
    error "Failed to detect Ghidra version from properties file."
    return 1
  fi
}

build() {
  cd "${pkgname%-git}"

  # Use the default system JDK (Ghidra JARs may require Java >= version used to compile them)

  # Determine Ghidra installation directory for dependencies
  local _ghidra_home="/opt/ghidra"
  if [ -d "/usr/share/ghidra" ]; then
     _ghidra_home="/usr/share/ghidra"
  fi
  export GHIDRA_INSTALL_DIR="${_ghidra_home}"

  # Determine target version from pom.xml (which we patched in prepare)
  local _ghidra_ver
  _ghidra_ver=$(grep "<ghidra.version>" pom.xml | sed 's|.*<ghidra.version>\(.*\)</ghidra.version>.*|\1|')

  # Install local Ghidra JAR dependencies required for compilation
  msg2 "Installing Ghidra dependencies to local Maven repository..."
  local _ghidra_jars=(
    "Generic"
    "SoftwareModeling"
    "Project"
    "Docking"
    "Decompiler"
    "Utility"
    "Base"
    "Gui"
    "FileSystem"
    "Help"
    "Emulation"
    "Debugger-api"
    "Framework-TraceModeling"
    "Debugger-rmi-trace"
    "DB"
  )

  for _jar_name in "${_ghidra_jars[@]}"; do
    local _found_jar
    _found_jar=$(find "${GHIDRA_INSTALL_DIR}" -name "${_jar_name}.jar" | head -n 1)

    if [ -f "$_found_jar" ]; then
      mvn install:install-file \
        -Dfile="$_found_jar" \
        -DgroupId="ghidra" \
        -DartifactId="$_jar_name" \
        -Dversion="$_ghidra_ver" \
        -Dpackaging="jar" \
        -DgeneratePom=true \
        -Dmaven.repo.local="$srcdir/.m2" \
        -Dquiet=true
    else
      error "Required JAR '${_jar_name}.jar' not found in $GHIDRA_INSTALL_DIR"
      return 1
    fi
  done

  msg2 "Building project..."
  mvn clean package assembly:single -DskipTests -Dmaven.repo.local="$srcdir/.m2"
}

package() {
  cd "${pkgname%-git}"

  # 1. Install MCP Bridge Python package (pyproject.toml at project root)
  msg2 "Building and installing bridge Python package..."
  python -m build --wheel --no-isolation
  local _wheel
  _wheel=$(find dist -name "*.whl" | head -n 1)
  python -m installer --prefix=/usr --destdir="$pkgdir" "$_wheel"
  msg2 "Bridge package installed"

  # 2. Install Ghidra Extension ZIP
  local _ext_zip
  _ext_zip=$(find target -name "GhidraMCP-*.zip" | head -n 1)
  
  # Standard location for extensions
  local _ext_dest="$pkgdir/opt/ghidra/Extensions/Ghidra"
  
  if [ -f "$_ext_zip" ]; then
    install -d "$_ext_dest"
    install -m644 "$_ext_zip" "$_ext_dest/$(basename "$_ext_zip")"
    msg2 "Extension ZIP installed to $_ext_dest"
  else
    error "Build artifact not found."
    return 1
  fi

  # 3. Install Documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname%-git}/README.md"
  if [ -f "CLAUDE.md" ]; then
    install -Dm644 CLAUDE.md "$pkgdir/usr/share/doc/${pkgname%-git}/CLAUDE.md"
  fi

  # 4. Clean up __pycache__ from package
  find "$pkgdir" -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
}
