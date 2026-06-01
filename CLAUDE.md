# AUR Package Preparation Guide for AI Agents

This document provides comprehensive guidance for AI agents tasked with preparing packages for the Arch User Repository (AUR). Follow these guidelines strictly to create high-quality, compliant packages.

---

## Table of Contents

1. [Initial Setup and Environment](#initial-setup-and-environment)
2. [Workflow Overview](#workflow-overview)
3. [Critical Rules and Prohibitions](#critical-rules-and-prohibitions)
4. [Handling Existing AUR Packages](#handling-existing-aur-packages)
5. [Repository Analysis Process](#repository-analysis-process)
6. [Dependency Resolution](#dependency-resolution)
7. [PKGBUILD Structure and Standards](#pkgbuild-structure-and-standards)
8. [Split Packages](#split-packages)
9. [Python Package Guidelines](#python-package-guidelines)
10. [Source Handling and Patches](#source-handling-and-patches)
11. [Testing and Validation](#testing-and-validation)
12. [Environment Cleanup](#environment-cleanup)
13. [Final Steps Before User Review](#final-steps-before-user-review)
14. [Checking for Updates](#checking-for-updates)

---

## Initial Setup and Environment

### System Context
- You are running on **Arch Linux**
- You have access to `pacman` (official repos) and `yay` (AUR helper) as superuser
- Use `sudo` for package management operations
- The working directory should contain your package preparation files

### First Action When Asked to Package a Tool

**ALWAYS clone the upstream repository first** for easy reference:

```bash
# Clone the upstream repository
git clone https://github.com/<owner>/<repo>.git <repo>-upstream

# This allows you to:
# - Browse source files for dependency analysis
# - Understand the build system
# - Identify what components exist (CLI, libraries, Python bindings, etc.)
# - Check license files
# - Review documentation
```

---

## Workflow Overview

When asked to package a tool, follow this sequence:

1. **Clone upstream repository** locally for reference
2. **Check if an AUR package already exists** for this tool
3. **If exists**: Pull the existing package and **compare versions**:
   - Compare AUR package `pkgver` with the latest upstream release tag
   - **If versions match**: STOP and inform the user that the package is already up-to-date. Do NOT proceed with changes unless explicitly asked to fix something specific.
   - **If upstream is newer**: Proceed with updating the package
4. **If new**: Create package from scratch
5. **Analyze the repository** for:
   - Build system (CMake, Meson, setuptools, pyproject.toml, etc.)
   - Dependencies (build-time and runtime)
   - Components (is it a library? CLI tool? Python bindings? All of them?)
   - License
6. **Resolve all dependencies** against official repos and AUR — including a
   **dependency analysis** that verifies each dependency's *available version*
   satisfies upstream's constraints (see Mandatory Dependency Analysis). If a
   dependency is itself orphaned/out-of-date below the required version, update
   it too.
7. **Prepare PKGBUILD** following all guidelines
8. **Generate .SRCINFO**
9. **Test the build locally** with `makepkg -si`
10. **Run the user-style functional test** — install the built package and
    actually use it as a user would, in a fresh-install-equivalent environment
    (see Mandatory User-Style Functional Test). A bare import test is NOT enough.
11. **Wait for user approval** before any AUR push operations
12. **After push**: Remove the local package, install from AUR with `yay -S`, and verify it works

---

## Critical Rules and Prohibitions

### ABSOLUTELY FORBIDDEN

1. **NEVER proceed with packaging if the AUR package is already up-to-date**
   - If the AUR package version matches the latest upstream release, STOP immediately
   - Inform the user: "Package X is already at version Y, matching the latest upstream release"
   - Only proceed if the user explicitly asks you to fix something specific

2. **NEVER use pip to install packages**
   - Not even as a build dependency
   - Not even "just to get some tool working"
   - ALL packages must be built from source or come from pacman/AUR

3. **NEVER use prebuilt binaries**
   - Do not download wheels from PyPI
   - Do not use pre-compiled binaries from upstream releases
   - Exception: If and only if source code is genuinely unavailable (extremely rare)

4. **NEVER push to AUR without explicit user request**
   - Prepare everything, test locally, then wait
   - The user will explicitly ask you to push when ready

5. **NEVER install to /usr/local/**
   - All files go under /usr/

6. **NEVER include pip install commands in PKGBUILD**
   - Build scripts that internally call pip must be patched to skip this
   - See the python-tensorrt-llm example for how to handle this

7. **NEVER mention Claude or AI in commit messages**
   - Commit messages should be simple and concise
   - Do not include "Co-Authored-By: Claude" or any AI attribution
   - Write commit messages as if you were a human maintainer

8. **NEVER claim a dependency is missing without actually checking**
   - Before declaring a package "blocked" or "infeasible" due to missing dependencies, you MUST run `pacman -Ss "^<depname>$"` (official repos) AND `yay -Si <depname>` or `yay -Ss <depname>` (AUR) for EVERY dependency
   - Do NOT guess or assume from memory — always verify with actual commands
   - Search with both exact and fuzzy matching: package names may differ from Python module names (e.g., `python-docx` vs `python-python-docx`, `rapidocr` vs `python-rapidocr-onnxruntime`)
   - When assessing feasibility of packaging a tool, create a concrete checklist of every dependency with its availability status (OFFICIAL / AUR / MISSING) before making a judgment
   - Only after exhaustively checking every dependency against both official repos and AUR can you declare something is truly missing or blocked

9. **NEVER reduce a package's functionality to work around YOUR build environment**
   - Do NOT trim CUDA/GPU architecture lists (`TORCH_CUDA_ARCH_LIST`, `NVTE_CUDA_ARCHS`,
     `CMAKE_CUDA_ARCHITECTURES`, `-gencode` sets), disable optional components/features,
     drop backends, or otherwise narrow what the package supports in order to make a build
     fit your disk, memory, or time budget. That silently changes which hardware/use-cases
     the package works on — a **functional regression** shipped to every user.
   - The package must ship its **full intended capability** (match upstream's default arch
     range / feature set, or a deliberate superset — never a subset chosen for build convenience).
   - Build-environment limits are YOURS to solve, not the package's: free disk space
     (clean stale `src/`/`pkg/`, pacman cache, compiler temp), build packages **sequentially**
     instead of concurrently, use a bigger build host (e.g. nibi), or raise limits — but the
     shipped PKGBUILD's arch/feature coverage stays complete.
   - A real failure this guards against: trimming Transformer-Engine's archs from
     `75;80;89;90;100;120` to `80;89;90` (dropping Turing + Blackwell support) just to shrink a
     disk-constrained compile. Wrong: the fix was to free disk + build sequentially at FULL
     coverage. The only legitimate reason to narrow an arch list is a genuine upstream/CUDA
     incompatibility (e.g. CUDA 13 dropped Volta sm_70) — not your machine's constraints.

### Build Requirements

- All packages must be **built from source**
- Use proper build tools: `python-build`, `python-installer`, `cmake`, `meson`, etc.
- Dependencies must be satisfied through pacman (official repos) or AUR packages

---

## Handling Existing AUR Packages

### Checking for Existing Packages

Before creating a new package, always check if it exists:

```bash
# Check official repositories first
pacman -Ss <package-name>

# Check AUR
yay -Ss <package-name>

# Or search on https://aur.archlinux.org/packages
```

### Updating an Existing Package

If an AUR package exists, you MUST pull it and update rather than create from scratch:

```bash
# Clone the existing AUR package
git clone ssh://aur@aur.archlinux.org/<pkgname>.git

# Or for read-only access:
git clone https://aur.archlinux.org/<pkgname>.git
```

### Maintainer Attribution Rules

When updating an existing package:

1. **Move the current maintainer to Contributors list**
2. **Keep all existing Contributors**
3. **Use the user's name and email as the new Maintainer** (found in existing PKGBUILDs: `Smoolak <smoolak@gmail.com>`)

Example header transformation:

**Before (existing package):**
```bash
# Maintainer: OldMaintainer <old@example.com>
# Contributor: PreviousContrib <prev@example.com>
```

**After (your update):**
```bash
# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: OldMaintainer <old@example.com>
# Contributor: PreviousContrib <prev@example.com>
```

**Note:** Always use the user's maintainer identity from existing PKGBUILDs in the workspace, not a placeholder or your own identity.

---

## Repository Analysis Process

### Step 1: Identify the Build System

Check for these files in priority order:

| File | Build System |
|------|--------------|
| `pyproject.toml` | Modern Python (PEP 517) |
| `setup.py` | Legacy Python setuptools |
| `CMakeLists.txt` | CMake |
| `meson.build` | Meson |
| `Makefile` | Make |
| `configure` | Autotools |
| `Cargo.toml` | Rust/Cargo |
| `go.mod` | Go modules |
| `BUILD` / `WORKSPACE` | Bazel |

### Step 2: Identify Package Components

Determine what the repository provides:

1. **Standalone CLI tool** - Can be used directly from command line
2. **C/C++ library** - Headers and shared libraries
3. **Python bindings** - Python wrapper around native code
4. **Pure Python library** - Python-only code
5. **Multiple components** - Combination of above

**This analysis determines if you need a split package** (see Split Packages section).

### Step 3: Identify Dependencies

Look for dependency specifications in:

- `pyproject.toml` → `[project.dependencies]` and `[build-system.requires]`
- `setup.py` → `install_requires` and `setup_requires`
- `requirements.txt` → Runtime dependencies
- `requirements-dev.txt` → Build/test dependencies
- `CMakeLists.txt` → `find_package()` calls
- `meson.build` → `dependency()` calls
- README/documentation → Often lists system requirements

### Step 4: Understand the Build Process

Read:
- README.md / INSTALL.md
- Contributing guidelines
- CI/CD configurations (.github/workflows/, .gitlab-ci.yml)
- Build scripts in scripts/ or tools/ directories

---

## Dependency Resolution

### Process for Each Dependency

**CRITICAL:** You MUST actually run these commands for EVERY dependency. Do NOT skip this step or rely on assumptions. Failing to check leads to incorrect feasibility assessments.

For every dependency identified:

1. **Check official Arch repositories first (use exact match):**
   ```bash
   pacman -Ss "^python-<name>$"
   ```

2. **If not found, check AUR (use exact and fuzzy search):**
   ```bash
   # Exact match
   yay -Si python-<name>

   # Fuzzy search (package names may differ from PyPI names)
   yay -Ss <name>
   ```

3. **Determine the correct Arch package name:**
   - Python packages: Usually `python-<name>` (e.g., `python-numpy`)
   - Libraries: Often same name or with `lib` prefix (e.g., `libheif`)
   - Tools: Usually same name (e.g., `cmake`)
   - **Watch out for name mismatches:** PyPI names often differ from Arch package names (underscores vs hyphens, prefixes, etc.). Always search with fuzzy matching if exact match fails.

4. **If dependency doesn't exist anywhere:**
   - You may need to package it first (recursive packaging)
   - Inform the user about missing dependencies

### Dependency Arrays in PKGBUILD

```bash
depends=(
    # Runtime dependencies - needed to run the software
    'python'
    'python-numpy'
    'some-library'
)

makedepends=(
    # Build-time only dependencies
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
    'cmake'
    'ninja'
)

checkdepends=(
    # Testing dependencies
    'python-pytest'
)

optdepends=(
    # Optional features
    'python-extra: for optional feature X'
)
```

### Important Dependency Rules

1. **Never rely on transitive dependencies** - List all direct dependencies explicitly
2. **Separate runtime from build dependencies** - Use `depends` vs `makedepends`
3. **Check dependency availability** before finalizing PKGBUILD
4. **Verify the AVAILABLE version satisfies the upstream constraint** - Existence is not enough
5. **Derive `depends` from what the code actually imports** - Not from a copied/old list

### Mandatory Dependency Analysis (do this for EVERY package, every update)

A dependency that merely *exists* is not sufficient. You MUST analyze, for each
package you build or update, both **which** dependencies are needed and whether
the **versions** Arch can provide actually satisfy upstream's requirements. A
real failure this guards against: `python-torchmetrics 1.9.0` requires
`lightning-utilities >=0.15.3`, but the AUR `python-lightning-utilities` was
orphaned at `0.14.3`. The package "built" and imported, but users hit
runtime/dependency errors. Checking existence alone (`yay -Si python-lightning-utilities`)
would NOT have caught this — only a **version** check against upstream's
requirement would.

For every package, produce an explicit dependency table before finalizing:

| Dependency | Module imported | Upstream constraint | Arch pkg | Available ver | Satisfies? |
|------------|-----------------|---------------------|----------|---------------|------------|

Steps:

1. **Read upstream's authoritative runtime requirements**, not just the metadata
   summary. Check `requirements/base.txt` / `requirements/core.txt`,
   `pyproject.toml [project.dependencies]`, `setup.py install_requires`. Note the
   **version bounds** (e.g. `>=0.15.3, <0.16.0`).

2. **Derive the actual import set from the source** — what does the package
   import at module-load time (top-level / column-0 imports = run on `import`)
   vs. lazily (inside functions = optional features)? Map each external top-level
   import to its Arch package and ensure it is in `depends`. Map lazy/guarded
   imports to `optdepends`. Example one-liner to list import-time externals:
   ```bash
   grep -rhoE '^(import|from) [a-zA-Z_][a-zA-Z0-9_.]*' "$srcdir/pkg" \
     | sed -E 's/^(import|from) //; s/\..*//' | sort -u
   ```
   Then subtract the Python stdlib (`python -c "import sys; print(sys.stdlib_module_names)"`).

3. **For each runtime dependency, check the AVAILABLE version satisfies the
   constraint**:
   ```bash
   pacman -Si python-<dep> | grep Version      # official
   yay -Si python-<dep>    | grep Version       # AUR
   ```
   If the available version is **below** upstream's minimum, that dependency
   ALSO needs updating (it may itself be orphaned/out-of-date — update it too,
   recursively) before this package can be considered correctly packaged.

4. **Distinguish `depends` from `optdepends` by import location**: a top-level
   `import X` that runs on `import thepackage` is a hard `depends`. An `import X`
   inside a function or guarded by `if package_available("X")` / try-except is
   `optdepends`. Do not put optional, feature-gated imports in `depends`, and do
   not leave a hard import out of `depends`.

5. **Don't blindly carry over the previous PKGBUILD's `depends`**. Re-derive them
   from the current source. Upstream adds/removes/retightens dependencies between
   releases; a stale list is how missing-dependency bugs ship.

---

## PKGBUILD Structure and Standards

### Complete PKGBUILD Template

```bash
# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Previous Maintainer <if updating existing package>

pkgname=package-name
pkgver=1.0.0
pkgrel=1
pkgdesc="Brief description of the package"
arch=('x86_64')  # or ('any') for arch-independent packages
url="https://github.com/owner/repo"
license=('MIT')  # Use SPDX format
depends=(
    'dependency1'
    'dependency2'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
checkdepends=(
    'python-pytest'
)
optdepends=(
    'optional-pkg: description of when needed'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/owner/repo/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('actual-sha256-hash-here')

prepare() {
    cd "$srcdir/repo-$pkgver"
    # Apply patches, fix compatibility issues
    # patch -Np1 -i "$srcdir/fix-something.patch"
}

build() {
    cd "$srcdir/repo-$pkgver"
    # Build commands here
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/repo-$pkgver"
    # Run tests
    pytest
}

package() {
    cd "$srcdir/repo-$pkgver"
    # Install commands
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
```

### Naming Conventions

| Type | Convention | Example |
|------|------------|---------|
| Python library | `python-<name>` | `python-numpy` |
| VCS/git package | `<name>-git` | `neovim-git` |
| Binary package | `<name>-bin` | `discord-bin` |
| Library | `lib<name>` or `<name>` | `libheif` |
| Application | `<name>` | `firefox` |

### Version Conventions

- Use upstream version exactly
- Replace hyphens with underscores if needed
- `pkgrel` starts at 1, increment for packaging changes only
- Reset `pkgrel` to 1 when `pkgver` changes

### Architecture

- Use `arch=('x86_64')` for compiled packages
- Use `arch=('any')` for pure Python or architecture-independent packages
- Packages without x86_64 support are NOT allowed in AUR

---

## Split Packages

### When to Use Split Packages

Create a split package when a repository provides **multiple independent components** that:

1. Can be installed separately
2. Have different dependencies
3. Users might want only one component

**Common scenarios requiring split packages:**

- C/C++ library + Python bindings
- Core library + CLI tool
- Main package + plugins
- Runtime + development headers

### Decision Criteria

Ask these questions:

1. **Can the CLI/tool be used WITHOUT the Python bindings?**
   - If YES → Consider split package

2. **Can the library be built independently from Python bindings?**
   - If YES → Consider split package

3. **Do different components have significantly different dependencies?**
   - If YES → Consider split package

### Split Package Structure

```bash
# Maintainer: Smoolak <smoolak@gmail.com>

pkgbase=package-name
pkgname=('package-name' 'python-package-name')
pkgver=1.0.0
pkgrel=1
pkgdesc='Description of the overall project'
arch=('x86_64')
url='https://github.com/owner/repo'
license=('BSD-3-Clause')
# Common dependencies for building all components
depends=('common-dep1' 'common-dep2')
makedepends=('cmake' 'ninja' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/owner/repo/archive/v$pkgver.tar.gz")
sha256sums=('...')

prepare() {
    cd "$pkgbase-$pkgver"
    # Common preparation for all packages
}

build() {
    cd "$pkgbase-$pkgver"

    # Build C/C++ component
    cmake -S . -B build -G Ninja \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_PYTHON=OFF
    cmake --build build

    # Build Python component
    cd python
    python -m build --wheel --no-isolation
}

# Package function for the native component
package_package-name() {
    pkgdesc='Native library/tool description'
    depends=('native-dep1' 'native-dep2')

    cd "$pkgbase-$pkgver"
    cmake --install build --prefix "$pkgdir/usr"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Package function for the Python bindings
package_python-package-name() {
    pkgdesc='Python bindings for package-name'
    arch=('any')  # If pure Python bindings
    depends=('python' 'python-dep1' 'package-name')  # May depend on native package

    cd "$pkgbase-$pkgver/python"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
```

### Real Example: CUTLASS Split Package

The `cutlass` package in this repository is a good example:

```bash
pkgbase=cutlass
pkgname=('cutlass' 'python-cutlass')

# cutlass - Native CUDA headers and libraries
# python-cutlass - Python bindings with different dependencies
```

Key points from this example:
- `pkgbase` defines the repository name
- `pkgname` is an array of all sub-packages
- Each `package_<name>()` function can override `pkgdesc`, `depends`, `arch`, etc.
- The Python package has `arch=('any')` because it's architecture-independent
- Different `depends` arrays for each component

---

## Python Package Guidelines

### Modern Build System (Recommended)

```bash
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'  # Or appropriate backend from pyproject.toml
)

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
```

### Key Flags Explained

- `--wheel` - Build only wheel format (not source distribution)
- `--no-isolation` - Use system packages instead of downloading from PyPI
- `--destdir="$pkgdir"` - Install to package directory, not system

### Check the Build Backend

Look at `pyproject.toml` for the build backend:

```toml
[build-system]
requires = ["setuptools", "wheel"]
build-backend = "setuptools.build_meta"
```

Add the backend to `makedepends`:
- `setuptools.build_meta` → `python-setuptools`
- `flit_core.buildapi` → `python-flit-core`
- `poetry.core.masonry.api` → `python-poetry-core`
- `hatchling` → `python-hatchling`
- `meson-python` → `meson-python`

### Handling Build Scripts That Use pip

Some projects have build scripts that internally call pip. You MUST patch these:

```bash
prepare() {
    cd "$_pkgname-$pkgver"

    # Patch out pip install commands
    sed -i '/pip install/d' scripts/build.py

    # Or use environment variable to skip
    # (if the script supports it)
}

build() {
    cd "$_pkgname-$pkgver"
    export SKIP_PIP_INSTALL=1
    python scripts/build.py
}
```

### Rust extension modules (pyo3/maturin) that bundle C libraries — disable LTO

Packages whose Rust build compiles **C/C++ libraries via the `cc` crate** (e.g.
`aws-lc-sys`, `pcre2-sys`, or a project's own `*-sys` wrapper) into a **pyo3
`cdylib`** will **silently break at import** if built with makepkg's default LTO.

- Arch's `makepkg.conf` ships `OPTIONS=(... lto)` + `LTOFLAGS="-flto=auto"`, so the
  `cc` crate inherits `-flto` and compiles those C libs to **LTO-bytecode object
  files**. The final Rust `cdylib` link is **not** an LTO link, so it cannot
  materialize those objects' symbols — they're left as **undefined dynamic symbols**.
- The build **succeeds** (shared objects allow undefined symbols), but `import`
  fails at runtime with `undefined symbol: <C function>` — and the dynamic linker
  reports only the *first* missing symbol, so it looks like one missing lib when
  hundreds are actually unlinked. `nm -D the.so | awk '$1=="U"'` shows the true scope.
- **Fix:** add `options=('!lto')` to the PKGBUILD. (This is why a working upstream
  manylinux/pip wheel can differ from your Arch build — pip/manylinux never applies
  makepkg's LTO.) This bit `python-ai-dynamo-runtime` (aws-lc/pcre2/nixl all unlinked);
  `!lto` fixed it. The rust toolchain version was a red herring — LTO lives in CFLAGS.

### Testing Python Packages

```bash
check() {
    cd "$_pkgname-$pkgver"

    # Set PYTHONPATH for packages not yet installed
    PYTHONPATH="$PWD:$PYTHONPATH" pytest

    # Or for compiled extensions:
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    PYTHONPATH="build/lib.linux-$CARCH-cpython-313:$PYTHONPATH" pytest
}
```

### Simple Import Test (Fallback)

When full tests aren't practical:

```bash
check() {
    cd "$_pkgname-$pkgver"
    PYTHONPATH="$PWD:$PYTHONPATH" python -c "import mypackage; print(mypackage.__version__)" || \
        echo "Warning: Import test failed"
}
```

> **WARNING — `import x; print(x.__version__)` is NOT sufficient validation.**
> A bare import (or worse, an import run in your dev container where unrelated
> packages are already installed) can pass while the package is still broken for
> a real user. `python-torchmetrics` shipped a working `import torchmetrics` but
> users still hit a missing/too-old dependency, because the import test (a) only
> touched the load path, not real usage, and (b) ran in an environment that
> already had the dependency. **Always do the user-style functional test below.**

### Mandatory User-Style Functional Test (before every push)

Test the package the way a user actually runs it, in an environment that matches
a fresh install. This is what catches missing/undeclared/too-old dependencies
that an import test misses.

1. **Install the built package as a user would**, pulling its declared closure:
   ```bash
   sudo pacman -U ./<pkg>-<ver>-<rel>-<arch>.pkg.tar.zst   # or: yay -S <pkg> after push
   ```
   Do NOT test only via `PYTHONPATH` against the source tree — that bypasses the
   packaged layout and the declared-dependency resolution.

2. **Beware the "it works on my box" trap.** Your dev container may already have
   packages installed (from other builds) that are NOT in this package's
   `depends`, masking a missing dependency. Before trusting a passing test,
   either test on a clean container, or explicitly check that nothing outside the
   declared closure is being relied on:
   ```bash
   # confirm import pulls in nothing beyond the declared deps
   python - <<'PY'
   import sys; before=set(sys.modules)
   import mypackage
   loaded={m.split('.')[0] for m in set(sys.modules)-before}
   print("external roots loaded on import:", sorted(loaded))
   PY
   ```
   A quick way to simulate a fresh install is to block suspect modules with a
   `sys.meta_path` finder that raises `ModuleNotFoundError`, then import and use
   the package — if it still works, those modules are genuinely optional.

3. **Exercise the real API surface**, not just `import`. Instantiate the main
   objects and run representative operations across the package's domains (e.g.
   for a metrics library: build several metrics, `update()`/`compute()`, a
   `MetricCollection`, a `.plot()`), and assert the outputs are sane. Many deps
   are imported lazily inside functions, so they only surface when you actually
   call the relevant code path.

4. **Run the dependency table from the Dependency Analysis section** against the
   *installed* package and confirm every import-time module resolves to a
   declared `depends`, and every lazy one to an `optdepends`.

5. **`namcap` the built package** and resolve real findings (missing deps, wrong
   optional/required classification).

Only after the user-style functional test passes is the package ready to push.

---

## Source Handling and Patches

### Source Array Format

```bash
# Standard release tarball
source=("$pkgname-$pkgver.tar.gz::https://github.com/owner/repo/archive/refs/tags/v$pkgver.tar.gz")

# Git repository (for -git packages)
source=("git+https://github.com/owner/repo.git")

# Multiple sources with patches
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/owner/repo/archive/v$pkgver.tar.gz"
    "fix-build.patch"
    "arch-linux-compat.patch"
)

# Architecture-specific sources
source_x86_64=("binary-tool::https://example.com/tool-x86_64")
```

### Generating Checksums

```bash
# Generate sha256sums for sources
makepkg -g >> PKGBUILD

# Or manually
sha256sum filename.tar.gz
```

### Creating Patches

When upstream code needs modifications:

```bash
# Create a diff
cd source-directory
cp original-file.cpp original-file.cpp.orig
# ... make changes ...
diff -u original-file.cpp.orig original-file.cpp > ../fix-something.patch

# Or using git
git diff > ../changes.patch
git diff HEAD~1 > ../last-commit.patch
```

### Applying Patches

```bash
prepare() {
    cd "$pkgname-$pkgver"

    # Apply patch with -p1 (strip one directory level)
    patch -Np1 -i "$srcdir/fix-something.patch"

    # For patches that modify specific files:
    patch -Np1 < "$srcdir/another-fix.patch"
}
```

### Common Patch Scenarios

1. **Compatibility fixes** - For newer library versions (e.g., glog 0.7.x compatibility)
2. **Build system fixes** - When upstream assumptions don't match Arch
3. **Path corrections** - Fixing hardcoded paths
4. **Dependency adjustments** - Removing or relaxing version constraints

---

## Testing and Validation

### Building Locally

```bash
# In the PKGBUILD directory:

# Build and install
makepkg -si

# Build only (don't install)
makepkg -s

# Force rebuild
makepkg -sf

# Skip checksums (during development only!)
makepkg -s --skipinteg

# With more verbose output
makepkg -s --noconfirm 2>&1 | tee build.log
```

### Using namcap

```bash
# Check PKGBUILD for issues
namcap PKGBUILD

# Check built package
namcap package-name-1.0.0-1-x86_64.pkg.tar.zst
```

Common namcap warnings to address:
- Missing dependencies
- Unused dependencies
- Incorrect permissions
- References to $srcdir or $pkgdir in installed files

### Generating .SRCINFO

**ALWAYS regenerate .SRCINFO after PKGBUILD changes:**

```bash
makepkg --printsrcinfo > .SRCINFO
```

The .SRCINFO file must be committed alongside PKGBUILD changes.

### Post-Push AUR Installation Verification

After pushing a package to the AUR, **always verify it installs correctly from the AUR** as a final validation step. This catches issues that local builds miss, such as incorrect source URLs, missing .SRCINFO updates, or AUR metadata problems.

```bash
# Remove the locally-built package first
sudo pacman -R --noconfirm <pkgname>

# Install fresh from AUR
yay -S --noconfirm <pkgname>

# Verify the package works (e.g., for Python packages)
python -c "import <module>; print(<module>.__version__)"
```

This step ensures the package as seen by AUR users actually builds and installs correctly end-to-end.

---

## Environment Cleanup

After testing is complete and before user review, clean up the environment to leave only the essential package directory.

### What to Keep

Only **one directory** should remain: the AUR git repository directory containing your package files. This is the directory that will be pushed to the AUR.

```
working-directory/
└── package-name/          # KEEP: AUR git repo with PKGBUILD, .SRCINFO, etc.
    ├── .git/
    ├── PKGBUILD
    ├── .SRCINFO
    ├── LICENSE
    └── *.patch (if any)
```

### What to Remove

Remove all temporary files and directories created during the packaging process:

1. **Upstream source clones** - The reference repository cloned at the start
2. **Build artifacts** - `src/` and `pkg/` directories created by makepkg
3. **Downloaded sources** - Tarballs and other downloaded files
4. **Built packages** - The `.pkg.tar.zst` files (unless user wants to keep them)

### Cleanup Commands

```bash
# Navigate to working directory
cd /path/to/working-directory

# Remove the upstream reference clone
rm -rf <repo>-upstream

# Remove makepkg build directories (if outside the package dir)
rm -rf src/ pkg/

# Remove downloaded source tarballs
rm -f *.tar.gz *.tar.xz *.tar.bz2

# Remove built package files (optional - ask user if they want to keep)
rm -f *.pkg.tar.zst

# Clean inside the AUR package directory as well
cd package-name/
rm -rf src/ pkg/ *.tar.gz *.tar.xz *.pkg.tar.zst

# Verify only the necessary files remain
ls -la
# Should show: .git/  PKGBUILD  .SRCINFO  LICENSE  (and any patches)
```

### Cleanup Checklist

- [ ] Removed `<package>-upstream/` directory (the cloned upstream repo)
- [ ] Removed `src/` directory (makepkg source extraction)
- [ ] Removed `pkg/` directory (makepkg package staging)
- [ ] Removed downloaded source tarballs (`.tar.gz`, `.tar.xz`, etc.)
- [ ] Removed built package files (`.pkg.tar.zst`) - or confirmed user wants to keep
- [ ] Only the AUR git repository directory remains
- [ ] The AUR directory contains: `.git/`, `PKGBUILD`, `.SRCINFO`, `LICENSE`, and any necessary patches

### Why Cleanup Matters

1. **Clarity** - The user knows exactly which directory to push to AUR
2. **Disk space** - Source tarballs and build artifacts can be large
3. **Avoiding confusion** - No risk of committing wrong files to AUR
4. **Clean handoff** - Ready for user review with only essential files

---

## Final Steps Before User Review

### Checklist Before Completion

- [ ] Upstream repository cloned for reference
- [ ] Checked for existing AUR package
- [ ] All dependencies resolved (exist in repos or AUR)
- [ ] **Dependency analysis done**: every runtime import maps to a `depends`,
      every lazy import to an `optdepends`, and each dependency's **available
      version satisfies upstream's constraint** (orphaned/too-old deps updated too)
- [ ] `depends` re-derived from the current source (not copied from an old PKGBUILD)
- [ ] PKGBUILD follows naming conventions
- [ ] Maintainer/Contributor lines correct
- [ ] License specified in SPDX format
- [ ] No pip install or prebuilt binaries
- [ ] Split package used if appropriate
- [ ] Patches included for compatibility issues
- [ ] `makepkg -si` succeeds
- [ ] `namcap` produces no critical errors
- [ ] .SRCINFO generated
- [ ] **User-style functional test passed**: installed the built package and
      exercised the real API as a user would, in a fresh-install-equivalent
      environment (not just `import x` in a dev box that already has the deps)
- [ ] LICENSE file (0BSD) added for AUR contribution
- [ ] Environment cleaned up (only AUR git repo directory remains)
- [ ] After push: installed from AUR with `yay -S` and verified it works

### AUR Contribution LICENSE File

Every AUR package repository should include a LICENSE file that licenses your **contribution files** (PKGBUILD, patches, etc.). This is separate from the upstream software's license.

**Use the 0BSD (Zero Clause BSD) license** for AUR contributions:

```
Copyright Arch Linux Contributors

Permission to use, copy, modify, and/or distribute this software for
any purpose with or without fee is hereby granted.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL
WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES
OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE
FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY
DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN
AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT
OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
```

**Important distinctions:**
- The `LICENSE` file in the AUR repo root → licenses your PKGBUILD, patches, and contribution files
- The `license=()` array in PKGBUILD → specifies the upstream software's license
- The `install -Dm644 LICENSE ...` in `package()` → installs the upstream software's license

### Files to Have Ready

```
package-name/
├── PKGBUILD           # The build recipe
├── .SRCINFO           # Generated metadata
├── LICENSE            # 0BSD license for AUR contribution files
├── *.patch            # Any patches needed
└── (other sources)    # Additional local files if needed
```

### DO NOT

- Push to AUR without explicit user request
- Leave placeholder checksums (SKIP is only for git sources)
- Include build artifacts or downloaded sources
- Commit the `src/` or `pkg/` directories

### Inform the User

After preparation, provide:

1. Summary of the package(s) created
2. Any dependencies that needed to be packaged first
3. Any patches that were required and why
4. Build test results
5. Ask if they want you to push to AUR

---

## Quick Reference Commands

```bash
# Check if package exists in official repos
pacman -Ss <package>

# Check if package exists in AUR
yay -Ss <package>

# Install build dependencies and build
makepkg -si

# Generate .SRCINFO
makepkg --printsrcinfo > .SRCINFO

# Check package quality
namcap PKGBUILD
namcap *.pkg.tar.zst

# Clone existing AUR package
git clone https://aur.archlinux.org/<pkgname>.git

# Generate checksums
makepkg -g

# Update checksums in PKGBUILD
updpkgsums  # from pacman-contrib
```

---

## Example Packages Reference

The following packages in this repository serve as examples:

| Package | Type | Notable Features |
|---------|------|------------------|
| `cutlass` | Split package | Native library + Python bindings |
| `python-dllist` | Simple Python | Basic PEP 517 build |
| `python-roboflow` | Python with many deps | Complex dependency tree |
| `python-torch-tensorrt` | Complex build | Bazel, patches, CUDA |
| `python-tensorrt-llm` | Very complex | CMake, Conan, pip-skip patches |
| `python-pillow-avif-plugin` | Python with C ext | System library linking |
| `python-imagededup-git` | VCS package | Git source, pkgver() function |

Study these PKGBUILDs for patterns applicable to your packaging task.

---

## Checking for Updates

The previous monitoring service (`aur.embia.ai`) is **discontinued** — do not use it.
To check whether our AUR packages need updating, investigate each package directly:
its real upstream version, and its AUR out-of-date flag via the official AUR RPC.

### 1. Upstream version (manual, per package)

Read `url=` in each PKGBUILD to find the upstream, then compare the latest upstream
release/tag against the package's current `pkgver`:

```bash
# GitHub: latest release tag
curl -s https://api.github.com/repos/<owner>/<repo>/releases/latest \
  | python -c "import sys,json;print(json.load(sys.stdin)['tag_name'])"
# GitHub: all tags (when the project doesn't cut releases)
git ls-remote --tags --refs https://github.com/<owner>/<repo>.git \
  | awk -F/ '{print $NF}' | sort -V | tail
# PyPI projects
curl -s https://pypi.org/pypi/<project>/json \
  | python -c "import sys,json;print(json.load(sys.stdin)['info']['version'])"
```

If upstream is newer: update `pkgver`, reset `pkgrel=1`, refresh checksums
(`updpkgsums`), regenerate `.SRCINFO`, test-build, and — only after user approval — push.

### 2. AUR out-of-date flags + current AUR version (AUR RPC API)

The official AUR RPC reports the current AUR version and whether a package has been
flagged out-of-date. Batch many packages in one call with repeated `arg[]`:

```bash
curl -s "https://aur.archlinux.org/rpc/v5/info?arg[]=python-foo&arg[]=python-bar" \
  | python -m json.tool
```

Per-result fields that matter: `Version` (current AUR version), `OutOfDate` (`null`, or
a Unix timestamp if a user flagged it), `Maintainer`, `LastModified`.

### Critical rules

1. **Update to the latest** upstream version, never an intermediate one.
2. **Out-of-date flags and AUR comments**: report them to the user and **ask what to
   do** — NEVER act on a flag or follow comment advice without checking first; a flag
   may be wrong or may not match our packaging approach.
3. **Process systematically** and test-build each package before pushing.

### Workflow when asked to check for updates

1. Enumerate the packages we maintain (the package dirs in this workspace).
2. For each, get the current AUR `Version` + `OutOfDate` from the AUR RPC, and the real
   latest upstream version (step 1).
3. Present a table: package | AUR ver | upstream ver | flagged? | action.
4. Genuine upstream releases → update, test, push (with approval).
5. Out-of-date flags / comments → show the user and ask before acting.
6. After pushing, verify by installing from the AUR (`yay -S`).
