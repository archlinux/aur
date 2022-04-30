<!--
Copyright (c) 2020-2022 Paul Barker <paul@pbarker.dev>
SPDX-License-Identifier: CC-BY-4.0
-->

# ChangeLog for mirrorshades

## 0.2.0

Development release of mirrorshades.

* Move project to GitHub, the new project URL is
  <https://github.com/unnecessary-abstraction/mirrorshades>.

* Add GitHub mirroring support.

* Prune deleted branches when updating a mirrored git repository.

* Support multiple attempts when running custom commands.

* Add config validation using [desert](https://pypi.org/project/desert/)
  and [marshmallow](https://pypi.org/project/marshmallow/).

* Update and expand README file.

* Improve developer & contributor workflows
  with the addition of automatic linting & formatting.
  These checks are ran in GitHub Actions
  when contributing to the project via a pull request.
  They can also be ran locally using
  [pre-commit](https://pre-commit.com/).

* Satisfy the [REUSE Specification](https://reuse.software/spec/)
  to ensure licensing is clear.

## 0.1.3

Minor release of mirrorshades.

* Add setup.py script to support legacy build environments.

## 0.1.2

Bugfix release of mirrorshades.

* Make dependency on `gitlab` python module optional.

## 0.1.1

(yanked)

## 0.1.0

Initial release of mirrorshades.

* Supports mirroring git repositories by repository URL.

* Supports mirroring git repositories from a GitLab server using project or
  group paths. For groups, all projects within the group are mirrored.

* Supports mirroring from remote and cloud storage locations using rclone.

* Supports invoking custom commands to mirror from arbitrary sources.
