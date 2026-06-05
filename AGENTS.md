Follow this process to update the AUR package sources to a new version. The target major release will be provided in the chat. If it is not provided, halt immediately and ask for the version number before proceeding.

1. Locate the latest Ubuntu apt source for ecoDMS. The last known location was https://wissensdatenbank.scroll.site/ek/linux-sources-fur-ecodms, but this may change. If unavailable, fall back to searching the ecoDMS website at ecodms.de.

2. Download the `Release` and `Packages` files from the apt repository and save them to the `apt-downloads/` folder. Follow standard apt repository URL conventions when constructing the URLs. The `Release` file is saved for reference only; it is not used for automated verification in this workflow.

3. Use `grep-dctrl` to extract the `Version`, `Filename`, and `SHA256` hashes of the `ecodmsclient` package from the `Packages` file. Update `PKGBUILD` with the new version, URL, and checksum. Then regenerate `.SRCINFO` by running `makepkg --printsrcinfo > .SRCINFO`. Never edit `.SRCINFO` manually — it must always be derived from `PKGBUILD`.

4. Download the DEB file of `ecodmsclient` to the repository root.

5. Extract the DEB package members into `src/` using `ar x <deb> --output=src/`. Then extract the package contents into `deb-contents/` for dependency inspection: `tar -x --no-same-owner -f src/data.tar.gz -C deb-contents/`. Also copy `LICENSE` from the repository root into `src/` — makepkg's `package()` function runs from `src/` and will fail to find it otherwise when `--noextract` is used. Finally, verify the language files still exist at their expected paths: `deb-contents/opt/ecodms/ecodmsclient/language_en.qm` and `language_de.qm` must both be present.

6. Build the package in two steps. First verify source integrity (makepkg finds the DEB in the repository root, which is the default `SRCDEST`):
   ```
   makepkg --verifysource -f
   ```
   Then build using the pre-extracted `src/` tree:
   ```
   makepkg --noextract --noprepare -f
   ```
   Never pass `--skipinteg` — integrity must be verified against the checksums in `PKGBUILD`.

7. Run `namcap` over `PKGBUILD` and the resulting Arch package file, applying the following guidelines:
   - Ignore messages about relocations, incorrect folders, non-stripped binaries, and insecure runpaths.
   - Look especially for missing dependencies; these appear as "Referenced library '...' is an uninstalled dependency". For each one, decide:
     a) If the library is from `glibc` or `gcc-libs`, ignore it.
     b) Check `deb-contents/opt/ecodms/ecodmsclient/` — several dependencies are bundled with the deb. If the `.so` file is present there, ignore it.
     c) Following current best practices, also consider implicit dependencies; these should be listed in the package dependencies and must not be ignored unless excluded by a previous step.
     d) If an uninstalled dependency is not covered above, check whether it is available in the Arch repositories (preferred) or AUR (fallback). If found, add it to the dependencies in `PKGBUILD`, then regenerate `.SRCINFO` with `makepkg --printsrcinfo > .SRCINFO`.
     e) If the dependency cannot be located, report it and ask what to do.
   - Look for extraneous dependencies. Namcap reports these as "Unused shared library '...' by file". Remove every such library from the dependencies in `PKGBUILD`, then regenerate `.SRCINFO`.
   - If any dependency changes were made above, restart from step 6: rebuild the package and repeat this entire namcap step to confirm the changes are correct and no new issues have appeared. Iterate until namcap is clean with no further changes required.

8. Write a namcap analysis report to `NAMCAP.md` in the project root.

## Additional guidelines

- **Always treat local files as stale.** Before starting, delete the contents of `apt-downloads/`, `src/`, `pkg/`, `deb-contents/`, any `.deb` files in the repository root, and any `.pkg.tar.*` built packages. Always re-download all online resources — never reuse previously downloaded files.
- Keep all dependency lists in lexicographical order.
- Never commit or push changes.
