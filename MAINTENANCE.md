# Regular maintenance

## Updating versions

1. Bump version in `PKGBUILD`, and reset `pkgrel` to 1
2. Comment out the sha256 checksums in `PKGBUILD`
3. Run make to build the package
4. Use sha256sum to grab checksums and update PKGBUILD
5. `make clean`
6. `make` and verify working (again, verify sha256 checksums)
7. `make srcinfo`
8. Commit and push to `origin` and `aur` repositories.
