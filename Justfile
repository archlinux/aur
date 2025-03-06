# This is not required to build the package,
# it is just used to run lints on PKGBUILD and buildhelper.py

set working-directory := ""

# Run various lints (does not build the package)
check: check-format
    # Checking PKGBUILD
    namcap PKGBUILD
    @just shellcheck
    @just _check_srcinfo
    # Checking python
    -ruff check

# Run shellcheck (does not require pacman)
shellcheck:
    shellcheck --shell=bash --exclude=SC2034,SC2154,SC2164,SC2155 PKGBUILD

_check_srcinfo:
    #!/usr/bin/env bash
    # Checking .SRCINFO
    diff -u <(makepkg --printsrcinfo) .SRCINFO

# Checks code formatting
check-format:
    # Checking Python Formatting
    ruff format --check --quiet
    ruff check --select I --quiet

# Formats code
format:
    # Fixing Python Formatting
    ruff format
    ruff check --select I --fix

# Removes all build files and clears caches
clean:
    @# Using -X only removes explicitly ignored files, not new tracked files
    git clean -fdX

# Regnerate .SRCINFO
regen:
    #!/usr/bin/env bash
    makepkg --printsrcinfo > .SRCINFO
