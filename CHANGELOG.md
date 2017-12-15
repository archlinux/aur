# [v2.0.0 - 2017-12-14](https://gitahead.com/cgi-bin/update.py?platform=linux&version=1.4.14)

## GitAhead 2.0 requires a new license!

- All current commercial users can upgrade their license at no cost. Check your email for details.
- Non-commercial users can sign up for a free non-commercial account through a link in the app.
- The two week evaluation period will reset for all users, so a new license isn't required immediately.
- If you have any questions please contact us at support@gitahead.com.

## Added

- Added support for custom themes.

## Fixed

- Fixed failure to cleanup after conflict resolution in some cases.

# [v1.4.14 - 2017-12-11](https://gitahead.com/cgi-bin/update.py?platform=linux&version=1.4.13)

## Fixed

- Fixed regression in selecting the status (uncommitted changes) row after the working directory changes.
- Fixed failure to persist conflict resolution selections after refresh.

# [v1.4.13 - 2017-12-06](https://gitahead.com/cgi-bin/update.py?platform=linux&version=1.4.12)

## Fixed

- Fixed possible crash on newly initialized repos.
- Fixed crash on submodule update after fetch when new submodules are added.

## Changed

- Disallow automatic update to new major versions.

# [v1.4.12 - 2017-11-30](https://gitahead.com/cgi-bin/update.py?platform=linux&version=1.4.11)

## Added

- Added tag icon next to tag reference badges.
- Added option to show the full repository path in the title bar.

## Fixed

- Remember the size and location of the start dialog.
- Reset selection more consistently to the HEAD branch when it changes.

# [v1.4.11 - 2017-11-21](https://gitahead.com/cgi-bin/update.py?platform=linux&version=1.4.10)

## Added

- Added buttons to conflict hunks to choose 'ours' or 'theirs' changes.
- Disallow staging conflicted files that still contain conflict markers.
- Log all merge abort actions.
- Added log text to explain conflict resolution process.

## Fixed

- Fixed failure to show stashes or possible crash in some cases.
- Fixed regression in updating commit list reference badges when references are added and deleted.

# [v1.4.10 - 2017-11-10](https://gitahead.com/cgi-bin/update.py?platform=linux&version=1.4.9)

## Added

- Changed background color of conflict badges.
- Added status text to indicate the number of unresolved conflicts.
- Added conflict hunk background colors on ours and theirs lines.

## Fixed

- Fixed issue with spaces in .gitignore files.
- Fixed a small memory leak.
- Fixed conflict hunk check state.
- Fixed conflict hunk line number issue.
- (Mac) Fixed issue that prevented the disk image from mounting on systems older than macOS 10.12.

# [v1.4.9 - 2017-11-06](https://gitahead.com/cgi-bin/update.py?platform=linux&version=1.4.8)

## Added

- Added context menu action to remove multiple untracked files at once.
- Show detached HEAD label at a specific tag if any tags point directly to the commit.

## Fixed

- Fixed cancel during resolve.
- Fixed regression is showing the detached HEAD label in the commit list.
- Fixed failure to immediately index some commits if the indexer is running while references are updated.
- Fixed failure to get more than the first page of GitHub repositories.

# [v1.4.8 - 2017-10-30](https://gitahead.com/cgi-bin/update.py?platform=linux&version=1.4.7)

## Added

- Added prompt before staging directories.
- Substitute emoji for emoji short codes in commit messages.
- Added missing extension mapping for CoffeeScript.

## Fixed

- Sort conflicts to the top unconditionally.
- Automatically select the status row when the HEAD changes.
- Fixed commit list scroll performance on repositories with many refs.
- (Win) Search for git bash in default install location.
- (Win) Added warning dialog when an external tool fails because bash can't be found.

## Changed

- Changed the behavior of double-click in the file list to open the external diff/merge tool if one is enabled.

# [v1.4.7 - 2017-10-20](https://gitahead.com/cgi-bin/update.py?platform=linux&version=1.4.6)

## Added

- Added context menu actions to apply, pop, and drop stashes.

## Fixed

- Fixed issues related to revert and cherry-pick that result in a conflict.
- Fixed merge abort menu item to update more consistently.

# [v1.4.6 - 2017-10-17](https://gitahead.com/cgi-bin/update.py?platform=linux&version=1.4.5)

## Added

- Added advanced option to specify a custom URL for hosting providers.

## Fixed

- Fixed failure to execute pre-push hook (including LFS) in some cases.
- Fixed error messages on console.

# [v1.4.5 - 2017-10-10](https://gitahead.com/cgi-bin/update.py?platform=linux&version=1.4.4)

## Added

- Added option to merge without committing.
- Added context menu actions to stage/unstage multiple files at once.

## Fixed

- Fixed usability issues in the custom external tools editor interface.
- Don't yield focus to the commit message editor when staging files with the keyboard.
- Fixed state of stash toolbar button and menu item when the working directory is clean except for untracked files.
- Fixed failure to cherry-pick and revert when the working directory is dirty.
- Fixed hang on some diffs.
- Fixed garbage remote transfer rate when the elapsed time is too small to measure.
- (Mac) Fixed several issues on macOS 10.13.

# [v1.4.4 - 2017-09-22](https://gitahead.com/cgi-bin/update.py?platform=linux&version=1.4.3)

## Added

- Style editor content after saving a new file.

## Fixed

- Fixed style of tag reference badges that point to the HEAD.
- Fixed regression in showing images in the diff area.
- Fixed regression in indexing by lexical class.
- (Win) Fixed regression in staging "exectuable" files.

# [v1.4.3 - 2017-09-15](https://gitahead.com/cgi-bin/update.py?platform=linux&version=1.4.2)

## Added

- Added reference badge for the detached HEAD state.
- Added commit list context menu item to rebase a specific commit.
- Added remote branch context menu item to create a new local branch that tracks the remote branch.

## Fixed

- Fixed bugs in staging file mode changes.
- Fixed failure to look up the correct host name for SSH URLs that use an alias from the SSH config file.

## Changed

- Start indexer process with lower priority.
