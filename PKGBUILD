# Maintainer: Steve Holvoet <linux@steho.be>
pkgname=ghidra-mcp
pkgver=6.0.0
pkgrel=2
pkgdesc="Production-ready Model Context Protocol server for Ghidra reverse engineering platform"
arch=('any')
url="https://github.com/bethington/ghidra-mcp"
license=('Apache-2.0')
# Pin to the stable Ghidra release (extra) that upstream targets (12.1.2).
# ghidra-git provides 'ghidra' but would not satisfy the versioned constraint.
depends=('ghidra=12.1.2' 'python' 'python-mcp')
makedepends=('maven' 'java-environment=21' 'python-build' 'python-installer' 'python-hatchling')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2f62806b7a5e139d791c9d55e04893d68981be2fcc7fd987fa93a391a0956c0f')
install=ghidra-mcp.install

build() {
  cd "${pkgname}-${pkgver}"

  # Ensure JDK 21 is used for the build (Ghidra 12.1.2 release requirement)
  if [ -d "/usr/lib/jvm/java-21-openjdk" ]; then
    export JAVA_HOME="/usr/lib/jvm/java-21-openjdk"
  else
    warning "/usr/lib/jvm/java-21-openjdk not found. Build may fail."
  fi

  # Determine Ghidra installation directory for dependencies
  local _ghidra_home="/opt/ghidra"
  if [ -d "/usr/share/ghidra" ]; then
     _ghidra_home="/usr/share/ghidra"
  fi
  export GHIDRA_INSTALL_DIR="${_ghidra_home}"

  # Determine target version from upstream pom.xml
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

  msg2 "Building Python bridge wheel..."
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"

  # 1. Install Python MCP Bridge wheel (provides /usr/bin/bridge-mcp-ghidra)
  python -m installer --destdir="$pkgdir" dist/ghidra_mcp_bridge-*.whl

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
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
  if [ -f "CLAUDE.md" ]; then
    install -Dm644 CLAUDE.md "$pkgdir/usr/share/doc/${pkgname}/CLAUDE.md"
  fi
}
